class MembershipsController < ApplicationController

	def create
		house = House.find(params[:membership][:house_id])
		if house && params[:join_key] == house.join_key && house.is_member?(params[:membership][:user_id])
			Membership.create(membership_params)
			flash[:notice] = "You successfully joined #{house.name}!"
			redirect_to house
		else
			flash[:notice] = "Sorry, you were not able to join that house"
			redirect_to "/"
		end
	end

	private

	def membership_params
		params.require(:membership).permit(:house_id, :user_id)
	end
end
