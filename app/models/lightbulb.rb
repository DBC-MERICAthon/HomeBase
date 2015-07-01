class Lightbulb < ActiveRecord::Base
  def self.lights_on(bulb_number)
    bulb = Huey::Bulb.find(bulb_number)
    p "*" * 100
    p bulb
    bulb.update(on:true, bri:255)
  end

  def self.lights_off(bulb_number)
    bulb = Huey::Bulb.find(bulb_number)
    p "*" * 100
    p bulb
    bulb.update(on:false)
  end
end