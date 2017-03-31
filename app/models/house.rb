class House < ApplicationRecord

	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

	has_many :items, dependent: :destroy
	has_many :recurring, dependent: :destroy

	def is_member?(user_id)
		self.memberships.map(&:user_id).include?(user_id)
	end

end
