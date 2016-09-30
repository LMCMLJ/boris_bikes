require 'garage'

describe Garage do

  before :each do
    @garage = Garage.new
    @broken_bikes = ['bike1.1', 'bike2.1', 'bike3.1']
  end

  describe "#receive_bikes" do
    it "receives array of bike instances from van" do
      expect(@garage.receive_bikes(@broken_bikes)).to eq(true)
    end
  end

  describe "#send_bikes" do
    it "sends bikes on request to van" do
      @garage.fixed_bikes = @broken_bikes
      expect(@garage.send_bikes).to eq(@broken_bikes)
    end
  end

  describe "#fix_bikes" do
    it "takes an array of bikes where self.working == false, and sets it to true" do
      expect(@garage.fix_bikes).to eq true
    end
  end
end
