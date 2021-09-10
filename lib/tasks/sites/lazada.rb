# require 'nokogiri'
# require 'rubygems'
# require 'open-uri'

# class Lazada
#   attr_accessor :url

#   def initialize
#     @url = "https://www.lazada.vn"
#   end

#   def using_nokogiri(current_url)
#     doc = Nokogiri::HTML(URI.open(current_url))
#   end

#   def start_parsing
#     raw_home_page = using_nokogiri(@url)
#     collect_category(raw_home_page)
#   end

#   def collect_category(raw_home_page)
#     arr_category = []
#     byebug
#     raw_home_page.css(".lzd-site-menu-root .lzd-site-menu-root-item").each do |link|
#       category_name = link.
#     end
#     byebug
#   end
# end
