require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = 'https://www.annuaire-des-mairies.com/val-d-oise.html'

result, url_list = [], []
hash = Hash.new

def get_townhall_email(url)
  page = Nokogiri::HTML(open(url))
  mail = page.xpath("//tr[4]/td[2]")[0].text
  nom = page.xpath("//strong[1]/a").text
  (mail == "") ? {nom => "Email non fournis"} : {nom => mail}
end

page  = Nokogiri::HTML(open(PAGE_URL))
page.xpath('//td/p/a/@href').each do |url|
   url_list << "https://www.annuaire-des-mairies.com".concat(url.text.delete_prefix('.'))
end

start = Time.now
url_list.each do |town|
  puts email = get_townhall_email(town)
  result << email
end
stop = Time.now

puts result.to_s
puts("Fonction executer en #{stop -= start} seconde")