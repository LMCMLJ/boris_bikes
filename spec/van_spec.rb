require 'van'
describe Van do

  before :each do
    @van = Van.new
    @location = double(:location)
    allow(@location).to receive(:send_bikes).and_return(['bike1', 'bike2', 'bike3'])
    allow(@location).to receive(:receive_bikes).and_return(['bike1', 'bike2', 'bike3'])
  end

  describe 'Bike collection' do
    it 'saves an array of bikes' do
      expect(@van.bikes_from_van(@location)).to eq(['bike1', 'bike2', 'bike3'])
    end
  end

  describe 'Bike dropoff' do
    it 'Drops off bikes at "location"' do
      expect(@van.bikes_to_van(@location)).to eq(['bike1', 'bike2', 'bike3'])
    end
  end

end
