require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    cards = index_url.css(".roster-cards-container .student-card")
    contents = []

    cards.each do |card|
      hash = {}
      hash[profile_url] = card.css("a").attribute("href").text.strip
      hash[name] = card.css("a .card-text-container h4").text.strip
      hash[location] = card.css("a .card-text-container p").text.strip
      contents << hash
    end
    contents
  end

  def self.scrape_profile_page(profile_url)

  end

end
