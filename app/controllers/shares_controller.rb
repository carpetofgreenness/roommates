class SharesController < ApplicationController

	def show
		p "HELLO LOOK HERE IT IS DELETING"
		share = Share.find(params[:id])
		house = share.item.house
		share.destroy
		redirect_to house
	end

	def create
		share = Share.create(share_params)
		redirect_to share.item.house
	end

	private

	def share_params
		params.require(:share).permit(:user_id, :item_id, :owner)
	end
end
