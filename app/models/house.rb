class House < ApplicationRecord

	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

	has_many :transactions, dependent: :destroy
	has_many :recurring, dependent: :destroy

end
