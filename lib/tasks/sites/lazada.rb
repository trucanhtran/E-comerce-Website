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
    arr_category.each do |category|
      current_category = category[:category_name]
      category_link = "https:" + category[:category_link].first
      #get product paging
      collect_product_paging(current_category, category_link)
    end
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css(".lzd-site-menu-root").each do |link|

      begin
        #start getting category level 1
        link.css(".lzd-site-menu-root-item").each_with_index do |cat_lv1, index|
          category_level1_href = cat_lv1.at_css("a").values
          category_level1_text = cat_lv1.at_css("a span").text
          #save Category lv1 to db
          category_level1 = Category.find_or_create_by(name: category_level1_text)
          p " #{Time.zone.now} start getting category lever 1 #{category_level1_text.strip}"

          #start geting category level 2 belong to category lv1 with index
          ul_node = link.css(".lzd-site-menu-sub")[index]
          ul_node.css("li").each do |sub_link|

            begin
              sub_href = sub_link.at_css("a").values
              sub_name = sub_link.at_css("a span").text
              #save Category lv2 to db
              category_level2 = Category.find_or_create_by(name: sub_name, :ancestry => category_level1.id)

              arr_category<< {category_name: sub_name, category_link: sub_href }
              p " #{Time.zone.now} start getting category lv 2: #{sub_name} link #{sub_href}"

            rescue
              p " #{Time.zone.now} error here #{category_level1.strip}"
            end
          end
        end

      rescue
        p " #{Time.zone.now} can't parsing category lv1"
      end
    end
    #return category array
    arr_category
  end

  def collect_product_paging(current_category, category_link)
    # get_total_paging = using_nokogiri(category_link).css(".ant-pagination .ant-pagination-item").first.content.to_i || 1
    (1..10).each do |page|
      get_product_link("#{category_link}?page=#{page}", current_category)
    end
  end

  def get_product_link(category_link, current_category)
    arr_product_list = []
    document = using_nokogiri(category_link)
    document.at('script[type="application/ld+json"]')
  end

end
