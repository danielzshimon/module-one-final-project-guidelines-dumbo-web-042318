class Status
  @@situations = []

  def self.url
    "http://web.mta.info/status/ServiceStatusSubway.xml"
  end

  def self.update
    hash = XmlSimple.xml_in(open(url))
    @@situations = hash["ServiceDelivery"][0]["SituationExchangeDelivery"][0]["Situations"][0]["PtSituationElement"]
  end

  def self.situations
    @@situations
  end
end
