# class TwitterService
#
#   def initialize(user)
#     @oauth_token = user.oauth_token
#     @oauth_token_secret = user.oauth_token_secret
#   end
#
#   def client
#     Twitter::REST::Client.new do |config|
#       config.consumer_key        = ENV["twitter_consumer_api_key"]
#       config.consumer_secret     = ENV["twitter_consumer_api_secret"]
#       config.access_token        = @oauth_token
#       config.access_token_secret = @oauth_token_secret
#     end
#   end
# end

require 'httparty'
require 'nokogiri'

class HtmlParserIncluded < HTTParty::Parser
  def html
    Nokogiri::HTML(body)
  end
end

class Page
  include HTTParty
  parser HtmlParserIncluded

  # def self.get_meta_content(url)
  #   content = Page.get(url).css("meta[name='description']").first.attributes['content']
  #   puts content
  # end
end


# puts Page.get('https://jondowdle.com').css("h1").text
# puts Page.get('https://jondowdle.com').css("title").text
#
#
# puts Page.get('https://google.com').css("h1").text
# puts Page.get('https://google.com').css("title").text
# puts Page.get('http://emilydowdle.com').css("meta[name='description']")
# puts Page.get('https://google.com').css("meta[name='description']").first.attributes['content']
# puts Page.get('https://reddit.com').css("meta[name='description']").first.attributes['content']
# puts Page.get('https://facebook.com').css("meta[name='description']").first.attributes['content']
# .attributes.content
# puts Page.get('https://facebook.com').css("meta[name='description']")
