require 'gem_scraper'
namespace :gemscraper do

  desc "Pulls gems from rubygems.org"
  task update: :environment do
    Gem_Scraper.SetDbName("gemtastic_server_production")
    Gem_Scraper.SetDbUsername("gemtastic_server_production")
    Gem_Scraper.SetDbPassword("g3mt4st3s000g00d")
    Gem_Scraper.main(:long => true, :delay_max => 30)  
  end

end
