class Van
  attr_accessor :transport_bikes

  def initialize
    @transport_bikes = []
  end

  def bikes_to_van(location)
    @transport_bikes = location.send_bikes
  end

  def bikes_from_van(location)
    location.receive_bikes(@transport_bikes)
  end
end
