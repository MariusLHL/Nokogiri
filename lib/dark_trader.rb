require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
PAGE_URL = 'https://coinmarketcap.com/all/views/all/'

def coinmarket
begin
page  = Nokogiri::HTML(open(PAGE_URL))
name , value , array = [], [], []
hash = Hash.new


puts "Getting all value"
page.xpath('//tr/td[5]/a').each do |w|
  value << w.text.delete('$,').to_f
end

puts "Getting all name"
page.xpath('//tr/td[3]/div').each do |w|
  name << w.text
end

hash = name.zip(value)
puts "Putting them in an hash"
hash.each do |w| 
  array << {w[0] => w[1]}
end

rescue OpenURI::HTTPError => e
if e.message == '404 Not Found'
  puts  e.message
else
  raise e
end
end
return array
end

puts coinmarket.to_s
