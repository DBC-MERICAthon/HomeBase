class LightbulbsController < ApplicationController
  def lights_on
    redirect_to 'users/"#{current_user.id}"'
  end

  def lights_off
    redirect_to 'users/"#{current_user.id}"'
  end
end
