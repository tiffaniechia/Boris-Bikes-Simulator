require_relative "../lib/docking_station"

describe DockingStation do 

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new(:capacity => 20)}

  it "shoud accept a bike" do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end  

  it "should be able to release a bike" do 
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end  

  it "should know when it is full" do 
    expect(station.full?).to be_false
    20.times{station.dock(Bike.new)}
    expect(station.full?).to be_true
  end  

end  