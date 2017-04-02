class House < ApplicationRecord

	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

	has_many :items, dependent: :destroy
	has_many :recurring, dependent: :destroy

	has_attached_file :photo, styles: { medium: "300x300#", thumb: "100x100#" }
  	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	def is_member?(user_id_num)
		self.memberships.map(&:user_id).include?(user_id_num)
	end

end
