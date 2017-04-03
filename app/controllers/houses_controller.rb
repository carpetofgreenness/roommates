class HousesController < ApplicationController
	before_filter :authenticate_user!

	def show
		@house = House.find(params[:id])
		if current_user && current_user.houses.includes(@house)
			@permission = true
			@members = @house.users
			@transactions = @house.items
			@membership = @house.memberships.where("user_id=?",current_user.id).first
			@item = Item.new
		else
			@alert = "Sorry, you must be a member of this household to view this page."
			@permission = false
		end
	end

	def create
		@house = current_user.houses.create(house_params)

		if @house.save
			flash[:notice] = "Your house was created successfully"
			redirect_to @house
		else
			flash[:alert] = "There was a problem saving your house."
			redirect_to @house
		end
	end

	def update
		@house = House.find(params[:id])
		@house.update_attributes(house_params)

		if @house.save
			flash[:notice] = "Your house was created successfully"
			redirect_to @house
		else
			flash[:alert] = "There was a problem saving your house."
			redirect_to @house
		end

	end

	private

	def house_params
		params.require(:house).permit(:name, :description, :rent_start, :photo)
	end

end