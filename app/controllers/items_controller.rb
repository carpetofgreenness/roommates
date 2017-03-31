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
			redirect_to @item.house
		end
	end

	def update
		@item = Item.find(params[:item_id])
		@item.update_attributes(item_params)
		@item.shares.first.update_attribute("owner", true)

		# which sharers are newly checked
		(params[:sharers] - @item.split_with_ids).each do |sharer|
			User.find(sharer).shares.create(item_id: @item.id, owner: false)
		end

		# which sharers were newly unchecked
		(@item.split_with_ids - params[:sharers] - [current_user.id]).each do |sharer|
			@item.shares.where("user_id=?",sharer).first.destroy
		end

		if @item.save
			flash[:notice] = "Your transaction was edited successfully"
			redirect_to @item.house
		else
			flash[:alert] = "There was a problem editing your transaction."
			redirect_to @item.house
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :amount, :description, :shared, :house_id, :purchased)
	end

end
