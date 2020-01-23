require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = 'https://www.annuaire-des-mairies.com/val-d-oise.html'



def townhall
begin
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

url_list.each do |town|
  puts email = get_townhall_email(town)
  result << email
end

rescue OpenURI::HTTPError => e
  if e.message == '404 Not Found'
    puts  e.message
  else
    raise e
  end
  end
  return result
  end

  puts townhall