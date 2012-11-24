require 'rubygems'
require 'json'
require 'uri'
require 'net/http'
require 'net/smtp'
require 'array_extension'

require 'tlsmail'
require 'mail_conf'

class HackerNews
  attr_accessor :items, :points

  # Sets items and points based on json source
  def initialize(json_src=nil)
    hn_json = json_src || self.fetch_json
    self.items = JSON.parse(hn_json)["items"]
    self.points = []
    self.items.each{|i| self.points << i["points"]}
  end
  
  # This will be sent as a email message
  def statistics
    body = "Points statistics:\n"
    body <<  "  - Mean: #{self.points.mean}\n"
    body << "  - Median: #{self.points.mean}\n"
    body << "  - Mode: #{self.points.mode.join(',')}"
  end
  
  # Send email with statistcs.
  # Uses mail_conf to configure email.
  def send_statistics
    body = self.statistics

# Be careful with format of content
content =<<-EOS
FROM: #{EMAIL_FROM}
TO: #{EMAIL_TO}
SUBJECT: HackerNews home page statistics

#{body}
EOS

    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)  
    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', EMAIL_FROM, EMAIL_PASSWORD, :login) do |smtp| 
      smtp.send_message(content, EMAIL_FROM, EMAIL_TO)
    end
  end
  
  protected
  def fetch_json(url='http://api.ihackernews.com/page')
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end
end