require_relative '../config/environment'

# to get train line: situations[arrElem]["Affects"][0]["VehicleJourneys"][0]["AffectedVehicleJourney"][0]["LineRef"][0].split("_")[-1]
# to get condition: situations[arrElem]["Consequences"][0]["Consequence"][0]["Condition"][0]
# to get reason: situations[arrElem]["ReasonName"][0]

binding.pry
true
