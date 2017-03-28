class Item < ApplicationRecord
	cattr_accessor :current_user

	has_many :shares
	has_many :users, through: :shares
	belongs_to :house


	def current_user_share
		self.shares.where("user_id=?",current_user.id)
	end
end
