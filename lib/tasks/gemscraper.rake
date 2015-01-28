require 'net/http'
require 'json'
require 'rake-progressbar'

namespace :gemscraper do

  desc "Pulls gems from rubygems.org"
  task update: :environment do
    puts "Fetching list of all gems."
    gemlist = %x[gem list -r]
    puts "Fetched #{gemlist.lines.count} gems!\nNow parsing..."

    # Start progress bar
    bar = RakeProgressbar.new(gemlist.lines.count)

    # For each gem, get gem name and update it
    gemlist.each_line do |line|
      gemname = line.split("\ ")[0]
      update_gem(gemname, 0)

      # Increment bar
      bar.inc
    end

    # Finished!
    bar.finished
  end

  def get(gemname)
    url = "https://rubygems.org/api/v1/gems/#{gemname}.json"
    json_file.get(url, 4, age_max, 1.0E-3)
  end

  def update_gem(gemname, i)
    # Return false if we've tried updating this 10 times
    return false if i > 9

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
    # Else try it again and increment counter
    else
      puts "Can't load URL, trying again in 10 seconds\n"
      10.times do |x|
        sleep 1
        puts "."
      end
      puts "Retrying!\n"
      i++
      update_gem(gemname, i)
    end
  end

end
