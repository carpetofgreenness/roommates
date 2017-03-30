class ItemsController < ApplicationController

	def create
		@item = current_user.items.create(item_params)
		@item.shares.first.update_attribute("owner", true)

		params[:sharers].each do |sharer|
			User.find(sharer).shares.create(item_id: @item.id, owner: false)
		end

		if @item.save
			flash[:notice] = "Your transaction was created successfully"
			redirect_to @item.house
		else
			flash[:alert] = "There was a problem saving your transaction."
			redirect_to "/list"
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :amount, :description, :shared, :house_id, :purchased)
	end

end
