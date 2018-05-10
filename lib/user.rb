class User < ActiveRecord::Base
  has_many :trips

  def create_trip(origin, destination)
    Trip.create(origin: origin, destination: destination, user_id: self.id)
  end
end
