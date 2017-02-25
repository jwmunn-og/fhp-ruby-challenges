# Folling examples in http://ruby.bastardsbook.com/chapters/methods/

require "open-uri"
def fetch_page(url)
  return open(url).read
end

def count_html_tags(page, tag)
  pattern = /<#{tag}\b/
  tags = page.scan(pattern)
  return tags.length
end

sites = ["http://justinmunn.co", "http://www.thefirehoseproject.com/", "https://www.codewars.com"]
tags = ["a", "div", "img"]

sites.each do |url|
  puts "#{url} has:"
  tags.each do |tag|
    page = fetch_page(url)
    tag_count = count_html_tags(page, tag)
    puts "\t - #{tag_count} <#{tag}> tags"
  end
end
