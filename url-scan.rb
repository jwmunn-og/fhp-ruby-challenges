require "open-uri"
url = "http://justinmunn.co"
pattern = "<img"

page = open(url).read
tags = page.scan(pattern)
puts "The site #{url} has #{tags.length} img tags"