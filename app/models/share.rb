class Share < ApplicationRecord
	belongs_to :user
	belongs_to :item

	# calclate amount of share based on item total and number of users sharing
	def amount
		if self.item.shared
			item = self.item
			total = item.amount
			split = item.users.count
			amount = total/split
			self.owner ? amount : -amount
		else
			self.owner ? self.item.amount : -self.item.amount
		end
	end
end
