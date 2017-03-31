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
  		balance += share.amount if share
  	end

  	balance

  end

  def roommates(house_id)
    house = House.find(house_id)
    roommates = house.users - [self]
  end

  def owns(item_id)
    if Item.find(item_id).shares.where("user_id=?",self.id).first
      owns = Item.find(item_id).shares.where("user_id=?",self.id).first.owner
    else
      owns = false
    end
    owns
  end

end
