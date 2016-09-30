class Van
  attr_accessor :transport_bikes

  def initialize
    @transport_bikes = []
  end

  def pickup(location)
    @transport_bikes = location.request_bikes
  end

  def dropoff(location)
    location.provide_bikes(@transport_bikes)
  end
end
