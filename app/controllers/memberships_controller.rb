class MembershipsController < ApplicationController

	def create
		house_id = params[:membership][:house_id]
		house = House.find_by_id(house_id)
		user_id = params[:membership][:user_id]
		p "WILL IT LET ME JOIN?"
		p "the user is #{params[:membership][:user_id]}"
		p "the house is #{house_id}"
		p "is this user a member? #{house.is_member?(2)}" if house
		if !house
			flash[:notice] = "Sorry, we could not find a house with id #{house_id}"
			redirect_to "/"
		elsif params[:join_key] != house.join_key
			flash[:notice] = "Sorry, that join key did not match the house with id #{house_id}"
			redirect_to "/"
		elsif house.is_member?(user_id.to_i)
			flash[:notice] = "You are already a member of the house with the id #{house_id}, it is #{house.name}"
			redirect_to "/"
		else
			Membership.create(membership_params)
			flash[:notice] = "You successfully joined #{house.name}!"
			redirect_to house
		end
	end

	private

	def membership_params
		params.require(:membership).permit(:house_id, :user_id)
	end
end
