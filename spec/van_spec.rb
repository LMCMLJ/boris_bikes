require 'van'

describe Van do

  before :each do
    @van = Van.new
    @location = double(:location)
    @test_ary = ['bike1', 'bike2', 'bike3']
    allow(@location).to receive(:request_bikes).and_return(@test_ary)
    allow(@location).to receive(:provide_bikes).and_return(true)
  end

  describe "#pickup" do
    it "requests and saves an array from a specified location" do
      expect(@van.pickup(@location)).to eq(@test_ary)
    end
  end

  describe "#dropoff" do
    it "calls method to collect an array from a specified location" do
      expect(@van.dropoff(@location)).to eq(true)
    end
  end
end
