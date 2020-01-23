require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = 'http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'


def deputy

begin
page = Nokogiri::HTML(open(PAGE_URL))

url_array = []
first_name = []
last_name = []
mail_array = []
final_array = []
i = 0


page.xpath("//div[3]/div/ul/li/a").each do |name|
  array = name.text.split(" ")
  array.delete_at(0)
  puts array.to_s
  if array.size > 2
    first_name << array[0]
    last_name << array[1.. array.size].join('-')
  else
    first_name << array[0]
    last_name << array[1]
  end
end




page.xpath("//div[3]/div/ul/li/a/@href").each do |href|
  url_array << href
end
puts "Recuperation des mail cela peut prendre quelque minute"
url_array.each do |html|
  start = Time.now
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/".concat(html)))
  mail = page.xpath("//a[starts-with(@href, 'mailto')]/text()")[1].text
  mail_array << mail
  print mail
  stop = Time.now
  print " Resolu en : #{stop - start} seconde"
  puts
end

while i < first_name.size
  hash = Hash.new
  hash = {"first_name" => first_name[i], "last_name" => last_name[i], "email" => mail_array[i]}
  final_array << hash
  i += 1
end

rescue OpenURI::HTTPError => e
if e.message == '404 Not Found'
  puts  e.message
else
  raise e
end
end
return final_array
end

puts deputy