class Item < ApplicationRecord
	has_many :shares
	has_many :users, through: :shares
	belongs_to :house


	def find_share_of(user_id)
		self.shares.where("user_id=?",user_id).first
	end

	def owner
		self.shares.where("owner=?",true).first.user
	end

	def split_with
		self.shares.map(&:user).map(&:email).join(', ')
	end

end
