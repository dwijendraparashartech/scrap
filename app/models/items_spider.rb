require 'kimurai'


class ItemsSpider < Kimurai::Base
  @name = 'items_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end
  @config = {
    user_agent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.84 Safari/537.36",
    before_request: { delay: 4..7 }
  }


  def parse(response, url:, data: {})
    response.xpath("//ul[@class='repo-list']/div//h3/a").each do |a|
      request_to :parse_repo_page, url: absolute_url(a[:href], base: url)
    end

    if next_page = response.at_xpath("//a[@class='next_page']")
      request_to :parse, url: absolute_url(next_page[:href], base: url)
    end
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='shop-srp-listings__listing-container']").each do |item|
      item = {}

      item[:name]      =  item.css('h2.listing-row__name')&.text&.squish
      item[:address]      =  item.css('span.listing-row__address')&.text&.squish&.delete('^0-9').to_i
      item[:description] =  item.css('div.description')&.text&.squish
      item[:image_link]      =  item.css('span.image_link')&.text&.squish&.delete('^0-9').to_i
      item[:website] =  item.css('ul.website')[0]&.text&.squish.gsub('Ext. Color: ', '')
      item[:company_url] =  item.css('ul.company_url')[1]&.text&.squish.gsub('Int. Color: ', '')
      item[:founding_year] =  item.css('ul.founding_year')[2]&.text&.squish.gsub('Transmission: ', '')
      Item.where(item).first_or_create
    end
  end
end
