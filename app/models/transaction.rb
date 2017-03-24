class Transaction < ApplicationRecord
	has_many :shares
	has_many :users, through: :shares
end
