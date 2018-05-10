class TripLine < ActiveRecord::Base
  belongs_to :trip
  belongs_to :line
end
