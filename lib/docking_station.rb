require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :bike_rack
  attr_accessor :capacity
  attr_accessor :bike_rack_broken

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_rack = []
    @bike_rack_broken = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    @bike_rack.pop
  end

  def dock(bike)
    raise"Docking station full" if full?
    @bike_rack << bike
  end

  private

    def full?
      @bike_rack.count >= @capacity
    end

    def empty?
      @bike_rack.empty?
    end
end
