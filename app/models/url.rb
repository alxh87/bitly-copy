require 'securerandom'
require 'nokogiri'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, presence: true
	validates :long_url, format: { with: /\A(http|https):\/\/\S+/i, message: "check url"}
	validates :short_url, uniqueness: true
	before_create :shorten
	

	# def self.shorten
	# 	SecureRandom.hex(3)
	# end

	def getTitle
		self.title = Nokogiri::HTML(open(self.long_url)).title
		
	end

	def shorten
		self.short_url = SecureRandom.hex(3)
	end
end