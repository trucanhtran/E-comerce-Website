require 'nokogiri'
require 'httparty'
require 'csv'

word = ''
(110000..111400).each do |index|
  response = HTTParty.post('https://huflit.edu.vn/dstndk/action.php', body: { search: "17DH#{index}" })
  p "Start at #{index}"
  if !response.body.include?('Sinh viên không có tên trong đợt xét tốt nghiệp này.')
    a = Nokogiri::HTML(response.body)
    text = a.css('td').text
    puts "17DH11#{index} #{text} \n"
    word << "17DH11#{index} #{text} \n"
  end
end

File.open('huflit.doc', 'w') { |file| file.write(word) }
