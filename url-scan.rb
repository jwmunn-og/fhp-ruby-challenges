# Folling examples in http://ruby.bastardsbook.com/chapters/methods/

require "open-uri"
def count_html_tags(url, tag)
  pattern = /<#{tag}\b/
  page = open(url).read
  tags = page.scan(pattern)
  puts "The site #{url} has #{tags.length} #{tag} tags"
end

count_html_tags("http://justinmunn.co", "img")
count_html_tags("http://www.thefirehoseproject.com/", "div")
