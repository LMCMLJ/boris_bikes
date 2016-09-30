class Garage
  attr_accessor :fixed_bikes
  attr_accessor :broken_bikes

  def initialize
    @fixed_bikes = []
    @broken_bikes = []
  end

  def receive_bikes(incoming_bikes)
    @broken_bikes = incoming_bikes
    return true
  end

  def fix_bikes
    @broken_bikes.map do |bike|
      bike.working = true
      @fixed_bikes << bike
    end
    @broken_bikes = []
    true
  end

  def send_bikes
    @fixed_bikes
  end
end
