require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = 'http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'

page = Nokogiri::HTML(open(PAGE_URL))

url_array = []
first_name = []
last_name = []
mail_array = []
i = 0

page.xpath("//div[3]/div/ul/li/a").each do |name|
  array = name.text.split(" ")
  array.delete_at(0) 
  first_name << array[0]
  last_name << array[1]
end
puts first_name.size
puts last_name.size
page.xpath("//div[3]/div/ul/li/a/@href").each do |href|
  url_array << href
  puts href.text
end
puts "Recup mail"
url_array.each do |html|
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/".concat(html)))
  mail_array << page.xpath("//a[starts-with(@href, 'mailto')]/text()")[1].text
  puts page.xpath("//a[starts-with(@href, 'mailto')]/text()")[1].text
end
puts i
while i < first_name.size
  puts i
  hash = Hash.new
  hash = {"first_name" => first_name[i], "last_name" => last_name[i], "email" => mail_array[i]}
  puts hash.to_s
  i += 1
end