require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike}
  it 'dock a bike' do
    bike = Bike.new
    expect(DockingStation.new.dock(bike)).to eq bike
  end
  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
  it "no bike available" do
    if @bike == nil
    expect {subject.release_bike}.to raise_error("No bike available")
    end
  end
end

describe 'DockingStation should get a bike' do
  it 'release_bike' do
    if @bike != nil
    expect(DockingStation.new.release_bike).to be_a Bike
  end
  end
end

describe 'Is the bike working?' do
  it 'working?' do
    expect(Bike.new.working?).to be true
  end
end
