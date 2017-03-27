class Recurring < ApplicationRecord
	belongs_to :house
	has_many :will_shares
	has_many :users, through: :will_shares
end
