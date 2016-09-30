require 'docking_station'

describe DockingStation do

  before :each do
    @bike_normal = Bike.new
    @bike_broken = Bike.new(false)
    @station = DockingStation.new
    @station_overfull = DockingStation.new(35)
  end

  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument}

  context "bike intake" do

    describe "#dock" do
      it "returns array when working bike entered" do
        expect(subject.dock(@bike_normal)).to eq [@bike_normal]
      end
    end

    it 'returns docked bike' do
      @station.dock(@bike_normal)
      expect(@station.bike_rack).to eq [@bike_normal]
    end
  end

  context "bike release" do

    it "releases working bikes" do
      @station.dock(@bike_normal)
      bike = @station.release_bike
      expect(bike).to be_working
    end

    it "doesn't release a bike when there are none" do
      if @station.bike_rack == nil
        expect {@station.release_bike}.to raise_error("No bikes available")
      end
    end
  end

  context "capacity" do

    it "doesn't accept more than capacity" do
      @station.capacity.times{@station.dock(@bike_normal)}
      expect {@station.dock(@bike_normal)}.to raise_error("Docking station full")
    end

    it "user can set capacity" do
      expect(@station_overfull.capacity).to eq 35
    end

    it "there is a default capacity when none is entered at init" do
      expect(subject.capacity).to eq 20
    end
  end

  context "allows sorting broken and working bikes" do

    it "appends broken bikes to @bike_rack_broken" do
      subject.dock(@bike_broken)
      expect(subject.bike_rack_broken).to eq [@bike_broken]
    end

    it "appends working bikes to @bike_rack" do
    end
  end
end
