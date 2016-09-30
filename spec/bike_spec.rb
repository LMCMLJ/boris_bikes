require 'bike'

describe Bike do

  before :each do
    @broken_bike = Bike.new(false)
    @working_bike = Bike.new
  end

  it { is_expected.to respond_to :working? }

  it "check a bike can be not working" do
    expect(@broken_bike.working?).to eq false
  end
end
