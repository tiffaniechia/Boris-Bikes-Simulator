require_relative "../lib/garage"

describe Garage do
  
  let(:garage) {Garage.new}
  let(:bike) {Bike.new}
  let(:van) {Van.new}
  let(:station) {DockingStation.new}

  it "should fix broken bikes" do 
    bike.break
    station.dock(bike)
    van.collect_broken_bikes(station)
    van.release_broken_bikes(garage)
    expect(garage.broken_bikes.count).to eq(1)
    garage.fix_bikes
    expect(garage.broken_bikes.count).to eq(0)
  end  

end