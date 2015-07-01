class LightbulbsController < ApplicationController

  def update
    find_lightbulb = current_user.lightbulbs.find_by(params[:bulb_name])
    if params[:lightbulb][:state] == "true"
      Lightbulb.lights_on(find_lightbulb.bulb_number)

    else
      Lightbulb.lights_off(find_lightbulb.bulb_number)
    end
    redirect_to user_path
  end

end
