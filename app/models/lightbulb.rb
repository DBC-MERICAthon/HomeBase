class Lightbulb < ActiveRecord::Base
  def self.lights_on(bulb_number)
    bulb = Huey::Bulb.find(bulb_number)
    bulb.update(on:true, bri:255)
  end

  def self.lights_off(bulb_number)
    bulb = Huey::Bulb.find(bulb_number)
    bulb.update(on:false)
  end
end