class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shares
  has_many :items, through: :shares

  has_many :memberships
  has_many :houses, through: :memberships

  def balance(house_id)
  	house = House.find(house_id)
  	items = house.items
  	balance = 0
  	items.each do |item|
  		share = item.find_share_of(self.id)
  		balance += share.amount
  	end

  	balance

  end

end
