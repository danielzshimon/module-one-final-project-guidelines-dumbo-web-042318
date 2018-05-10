class Trip
  has_many :trip_lines
  has_many :lines, through: :trip_lines
  belongs_to :user
end
