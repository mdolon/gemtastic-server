require 'gem_scraper'
namespace :gemscraper do

  desc "Pulls gems from rubygems.org"
  task update: :environment do
    Gem_Scraper.SetDbName("gemtastic_server_production")
    Gem_Scraper.main(:long => true, :delay_max => 30)  
  end

end
