require 'net/http'
require 'json'
# require 'rake-progressbar'

namespace :gemscraper do

  desc "Pulls gems from rubygems.org"
  task update: :environment do

    # Always fetch a list of gems first, even if we are starting
    # at some point in the middle of the list
    #
    # Fetch all gems, abort if none found
    puts "Fetching list of all gems."
    gemlist = %x[gem list -r]
    abort("Couldn't load gems") unless gemlist.length > 0

    # Remove special characters and parse the list
    puts "Fetched #{gemlist.lines.count} gems!\nNow parsing..."
    gemlist = gemlist.gsub!(/\ .*?\n/im, "\n")

    if ENV['start'].present? && gemlist.index(ENV['start']).present?
      gemlist = gemlist.slice(gemlist.index(ENV['start'])..-1)
    end

    # Start progress bar
    # bar = RakeProgressbar.new(gemlist.lines.count)

    # For each gem, get gem name and update it
    gemlist.each_line do |line|
      gemname = line.split("\n")[0]
      update_gem(gemname, 0)
      # Increment bar
      # bar.inc
    end

    # Finished!
    # bar.finished
  end

  def get(gemname)
    url = "https://rubygems.org/api/v1/gems/#{gemname}.json"
    json_file.get(url, 4, age_max, 1.0E-3)
  end

  def update_gem(gemname, i)
    # Return false if we've tried updating this 51 times
    return false if i > 50

    # Otherwise, set the URL and load request
    url = "https://rubygems.org/api/v1/gems/#{gemname}.json"
    resp = Net::HTTP.get_response(URI.parse(url))

    # If header in tact, save data to gem (upsert)
    if resp.msg == "OK"
      gemjson = JSON.parse(resp.body)
      gemjson["licenses"] = gemjson["licenses"].to_a.to_s
      gemjson["dependencies"] = gemjson["dependencies"].to_a.to_s
      rubygem = Rubygem.find_or_initialize_by(name: gemname)
      rubygem.update_attributes(gemjson)
      rubygem.save
      puts "Completed #{gemname}"
    # Else try it again and increment counter
    else
      puts "Stalling #{gemname}"
      10.times do |x|
        sleep 1
      end
      i++
      update_gem(gemname, i)
    end
  end

end
