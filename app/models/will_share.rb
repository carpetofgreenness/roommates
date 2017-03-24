class WillShare < ApplicationRecord
	belongs_to :recurring
	belongs_to :user
end
