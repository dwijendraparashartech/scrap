require 'nokogiri'
require 'open-uri'
require 'pry'
require 'httparty'
require 'byebug'
require 'json'

class Scraper

	def all_countries
  unparsed_page = HTTParty.get('https://www.worldometers.info/coronavirus/')
  parsed_page = Nokogiri::HTML(unparsed_page) 
  byebug
end


	def scrape_web_urls
	idaho_url = 'https://www.ycombinator.com/companies'
	html = open(idaho_url)
	doc = Nokogiri::HTML(html)
	websites = doc.css(#'website').css.browseCategoryItem').css(a)


    websites.each do |website|
    	url = website.attribute('href').value
	binding.pry
end

scrape = Scraper.new
scrape.scrape_website_urls


