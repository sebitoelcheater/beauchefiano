class Message < ActiveRecord::Base
	belongs_to :message
	has_many :messages
	has_many :likes
	belongs_to :user
	before_save :set_date

	def set_date
		

end