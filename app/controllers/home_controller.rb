class HomeController < ApplicationController

  def index
  end


  def user_data
    render json: current_user
  end

end
