class Bike
  def initialize(status = true)
    @status = status
  end

  def working?
    @status
  end
end
