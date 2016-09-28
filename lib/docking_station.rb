

class DockingStation
  attr_accessor :bike

  def release_bike
    if @bike == nil
      raise "No bike available"
    else
   Bike.new
    end
  end

  def dock(bike)
   @bike = bike
  end

end
