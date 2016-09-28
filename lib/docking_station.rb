

class DockingStation
  attr_accessor :bike

  def release_bike
    raise "No bike available" if @bike == nil
    Bike.new
  end

  def dock(bike)
   @bike = bike
  end

end
