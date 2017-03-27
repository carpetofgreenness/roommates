class HousesController < ApplicationController
	before_filter :authenticate_user!

	def show
		@house = House.find(params[:id])
		if current_user && current_user.houses.includes(@house)
			@permission = true
			@members = @house.users
			@transactions = @house.transactions
		else
			@alert = "Sorry, you must be a member of this household to view this page."
			@permission = false
		end
	end
end