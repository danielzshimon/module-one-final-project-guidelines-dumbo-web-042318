class Line < ActiveRecord::Base
  has_many :trip_lines
  has_many :trips, through: :trip_lines

  def status
    Status.update
    Status.all.select do | status |
      status.line == self
    end
  end
end
