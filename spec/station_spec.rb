require 'station'

describe Station do

  before(:each) {@station = Station.new("Aldgate East",2)}

  it 'should be initialised with a name' do
    expect(@station.name).to eql("Aldgate East")
  end

  it 'should be initialised with a zone' do
    expect(@station.zone).to eql(2)
  end
end