module MTAStatus
  def url
    "http://web.mta.info/status/ServiceStatusSubway.xml"
  end

  def update
    hash = XmlSimple.xml_in(open(url))
    situations = hash["ServiceDelivery"][0]["SituationExchangeDelivery"][0]["Situations"][0]["PtSituationElement"]
  end
end
