class House < ApplicationRecord

	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

	has_many :items, dependent: :destroy
	has_many :recurring, dependent: :destroy

	def is_member?(user_id_num)
		self.memberships.map(&:user_id).include?(user_id_num)
	end

end
