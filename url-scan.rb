# Folling examples in http://ruby.bastardsbook.com/chapters/methods/

require "open-uri"
def count_html_tags(url, tag)
  pattern = /<#{tag}\b/
  page = open(url).read
  tags = page.scan(pattern)
  puts "The site #{url} has #{tags.length} #{tag} tags"
end

url = "http://justinmunn.co"
tags = ["a", "div", "img"]

tags.each do |tag|
  count_html_tags(url, tag)
end