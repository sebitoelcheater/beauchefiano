class Like < ActiveRecord::Base
	belongs_to :message
	belongs_to :user
	validates_presence_of :message_id
	validates_presence_of :user_id
end
