class SharesController < ApplicationController

	def show
		p "HELLO LOOK HERE IT IS DELETING"
		share = Share.find(params[:id])
		house = share.item.house
		share.destroy
		redirect_to house
	end
end
