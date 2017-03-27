class PagesController < ApplicationController
  before_filter :authenticate_user!

  def home
 	@houses = current_user.houses
  end
end
