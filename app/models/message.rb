class Message < ActiveRecord::Base
	belongs_to :message
	has_many :messages
	has_many :likes
	belongs_to :user
end
