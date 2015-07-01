class Family < ActiveRecord::Base
  has_many :users
  has_many :lightbulbs
  def users
    User.where(family_id: self.id)
  end
end
