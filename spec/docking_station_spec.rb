require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'doesn\'t release a bike when there are none' do
    docking_station = DockingStation.new
    if docking_station.bikes == nil
      expect {subject.release_bike}.to raise_error("No bikes available")
    end
  end

  it "doesn't accept more than capacity" do
    bike = Bike.new
    subject.capacity.times{subject.dock(bike)}
    if subject.bikes.count >= subject.capacity
      expect {subject.dock(bike)}.to raise_error("Docking station full")
    end
  end

  it "user can set capacity" do
    docking_station = DockingStation.new(30)
    expect(docking_station.capacity).to eq 30
  end

  it "there is a default capacity" do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq 20
  end

end

describe "initialization" do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it "there is a default capacity" do
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error "Docking station full"
  end
end
