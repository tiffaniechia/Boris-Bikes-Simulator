require_relative "../lib/docking_station"

describe DockingStation do 

  it "shoud accept a bike" do
    bike = Bike.new
    station = DockingStation.new
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end  

end  