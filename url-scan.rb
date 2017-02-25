# Folling examples in http://ruby.bastardsbook.com/chapters/methods/

require "open-uri"
def count_image_tags(url)
  pattern = "<img"
  page = open(url).read
  tags = page.scan(pattern)
  puts "The site #{url} has #{tags.length} img tags"
end

count_image_tags("http://justinmunn.co")
count_image_tags("http://www.thefirehoseproject.com/")
