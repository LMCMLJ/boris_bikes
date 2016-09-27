require 'boris_bikes'

describe 'DockingStation' do
  it 'should check if the bike is working' do
    expect(working?).to eq 'true'
  end
end
