require 'hacker_news'

puts "Fetching HN homepage..."
hn = HackerNews.new

puts "Sending email..."
hn.send_statistics

puts "\n\033[32mEmail sent\033[0m\n"


