require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    cards = index_url.css(".roster-cards-container .student-card")
    contents = []

    cards.each do |card|
      hash = {}
      hash[:name] = card.css("a .card-text-container h4").text.strip
      hash[:location] = card.css("a .card-text-container p").text.strip
      hash[:profile_url] = card.css("a").attribute("href").text.strip
      contents << hash
    end
    contents
  end

  def self.scrape_profile_page(profile_url)
    vital_text = profile_url.css(".vitals-container .vitals-text-container")
    social = profile_url.css(".vitals-container .social-icon-container a")
    hash = {}
    hash[:name] = vital_text.css(".profile_name").text.strip
    hash[:location] = card.css(".profile_location").text.strip
    hash[:profile_quote] = card.css(".profile_quote").text.strip

    hash[:twitter] = social.match(/twitter.com/)
    social.each do |link|
      link.attribute("href")
    end
  end

end
