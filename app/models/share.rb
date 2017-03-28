class Share < ApplicationRecord
	belongs_to :user
	belongs_to :item

	# calclate amount of share based on item total and number of users sharing
	def amount
		item = self.item
		total = item.amount
		split = item.users.count
		amount = total/split
		self.owner ? amount : -amount
	end
end
