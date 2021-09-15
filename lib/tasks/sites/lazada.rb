require 'nokogiri'
require 'rubygems'
require 'open-uri'

class Lazada
  attr_accessor :url

  def initialize
    @url = "https://www.lazada.vn"
  end

  def using_nokogiri(current_url)
    doc = Nokogiri::HTML(URI.open(current_url))
  end

  def start_parsing
    raw_home_page = using_nokogiri(@url)
    arr_category = collect_category(raw_home_page)
    p arr_category
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css(".lzd-site-menu-root").each do |link|

      begin
        #start getting category level 1
        link.css(".lzd-site-menu-root-item").each_with_index do |cat_lv1, index|
          category_level1_href = cat_lv1.at_css("a").values
          category_level1_text = cat_lv1.at_css("a span").text
          p "start getting category lever 1 #{category_level1_text.strip}"

          #start geting category level 2 belong to category lv1 with index
          ul_node = link.css(".lzd-site-menu-sub")[index]
          ul_node.css("li").each do |sub_link|

            begin
              sub_href = sub_link.at_css("a").values
              sub_text = sub_link.at_css("a span").text
              arr_category<<{category_level1: category_level1_text, sub_text: sub_text, sub_href: sub_href }
              p "start getting category lv 2: #{sub_text} link #{sub_href}"

            rescue
              p "error here #{category_level1.strip}"
            end
          end
        end

      rescue
        p "can't parsing category lv1"
      end
    end
    #return category array
    arr_category
  end

  def get_product_link

  end

end
