class Status
  # to get train line: situations[arrElem]["Affects"][0]["VehicleJourneys"][0]["AffectedVehicleJourney"][0]["LineRef"][0].split("_")[-1]
  # to get condition: situations[arrElem]["Consequences"][0]["Consequence"][0]["Condition"][0]
  # to get reason: situations[arrElem]["ReasonName"][0]

  attr_reader :condition, :reason, :line_id

  @@all = []

  # instance methods

  def initialize(condition, reason, line_id)
    @condition = condition
    @reason = reason
    @line_id = line_id

    @@all << self
  end

  def line
    Line.find(self.line_id)
  end

  # class methods

  def self.all
    @@all
  end

  def self.url
    "http://web.mta.info/status/ServiceStatusSubway.xml"
  end

  def self.get_status
    hash = XmlSimple.xml_in(open(url))
    hash["ServiceDelivery"][0]["SituationExchangeDelivery"][0]["Situations"][0]["PtSituationElement"]
  end

  def self.update
    @@all.clear
    self.get_status.each do | situation |
      line = situation["Affects"][0]["VehicleJourneys"][0]["AffectedVehicleJourney"][0]["LineRef"][0].split("_")[-1]
      line_obj = Line.find_by name: line
      condition = situation["Consequences"][0]["Consequence"][0]["Condition"][0]
      reason = situation["ReasonName"][0]

      self.new(condition, reason, line_obj.id)
    end
  end
end
