class SharesController < ApplicationController

	def destroy
		p "HELLO LOOK HERE IT IS DELETING"
		share = Share.find(params[:id])
		house = share.transaction.house
		share.destroy
		redirect_to house
	end
end
