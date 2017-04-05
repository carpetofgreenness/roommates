class Item < ApplicationRecord
	has_many :shares
	has_many :users, through: :shares
	belongs_to :house

	validates_presence_of :name, :amount, :shared, :purchased, :house_id


	def find_share_of(user_id)
		self.shares.where("user_id=?",user_id).first
	end

	def owner
		self.shares.where("owner=?",true).first.user
	end

	# def split_with(user_email)
	# 	if self.shares.count > 1
	# 		p self.shares.count
	# 		everyone = self.shares.map(&:user).map(&:first_name - [user_email]
	# 		everyone.join(', ')
	# 	end
	# end

	def split_with(user_id)
		if self.shares.count > 1
			user = User.find(user_id)
			p self.shares.count
			everyone = self.shares.map(&:user).map(&:first_name) - [user.first_name]
			everyone.join(', ')
		end
	end

	def split_with_ids
		self.shares.map(&:user).map(&:id)
	end

	def split_with?(user_id)
		self.shares.map(&:user).map(&:id).include?(user_id)
	end

end