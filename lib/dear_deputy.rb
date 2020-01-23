require 'rubygems'
require 'nokogiri'
require 'open-uri'

array = []
return_array = []
email_array = []
first_name = []
last_name = []

page = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=576&lang=fr&debut_deputes=550#pagination_deputes"))

def filter(mail)
  (mail.include?("@assemblee-nationale.fr")) ? (return mail) : nil
end

page.xpath("//li[5]/a[1]").each do |mail|
    email_array << mail.text
end

page.xpath("//li[1]/h2").each do |mot|
  array = mot.text.split(" ")
  array.delete_at(0)
  first_name << array[0] 
  last_name << array[1]
end

combined_array = first_name.zip(last_name, email_array)

combined_array.each do |l|
  hash = Hash.new
  hash ={ 
    "first_name" => l[0],
    "last_name" => l[1],
    "email" => l[2]
    }
    return_array << hash
end

puts return_array.to_s