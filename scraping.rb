require 'open-uri'
require 'nokogiri'
require 'csv'

def scraping(url)
p html = open("#{url}").read
nokogiri_doc = NokoGiri::HTML(html)
end

scraping('https://www.ycombinator.com/companies')