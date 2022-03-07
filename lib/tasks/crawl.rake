require './lib/tasks/sites/lazada.rb'

namespace :crawl do
  desc "start crawling data from shopee"
  task lazada: :environment do
    Lazada.new.start_parsing
  end

end
