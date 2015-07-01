class Lightbulb < ActiveRecord::Base
  def self.lights_on
    bulb = Huey::Bulb.find(1)
    bulb.update(on:true, bri:255)
  end

  def self.lights_off
    bulb = Huey::Bulb.find(1)
    bulb.update(on:false)
  end
end