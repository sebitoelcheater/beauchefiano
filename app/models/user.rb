class User < ActiveRecord::Base
	has_many :messages
	has_many :likes
	validates_presence_of :name
	validates_presence_of :url
	validates_uniqueness_of :url
end
