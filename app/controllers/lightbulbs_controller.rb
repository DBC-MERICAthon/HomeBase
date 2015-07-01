class LightbulbsController < ApplicationController

  def update
    find_lightbulb = current_user.lightbulbs.find_by(params[:bulb_name])
    p "* " * 100
    p params[:lightbulb][:state]
    p "* " * 100
    p params[:lightbulb][:state]
    if params[:lightbulb][:state] == "true"
      Lightbulb.lights_on(find_lightbulb.bulb_number)
      p "9" * 100

    else
      Lightbulb.lights_off(find_lightbulb.bulb_number)
      p "k" * 100
    end
    redirect_to user_path
  end

end
