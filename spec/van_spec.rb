require_relative "../lib/van"

class StubGarage; include BikeContainer; end

describe Van do 

  let(:station) {DockingStation.new}
  let(:van) {Van.new}
  let(:stub_garage) {StubGarage.new}

  before do 
    @broken_bike = Bike.new
    @broken_bike.break
    station.dock(@broken_bike)
  end  

  it "should load broken bikes into van" do
    expect(station.broken_bikes).to eq([@broken_bike])
    van.collect_broken_bikes(station)
    expect(van.bikes.count).to eq(1)
    expect(station.bikes.count).to eq(0)
  end  


  it "should release broken bikes to the garage" do 
    van.collect_broken_bikes(station)
    van.release_broken_bikes(stub_garage)
    expect(van.bikes.count).to eq(0)
    expect(stub_garage.bikes.count).to eq(1)
  end  

  context "fixed bikes" do

    before do 
      van.collect_broken_bikes(station)
      van.release_broken_bikes(stub_garage)
      @broken_bike.fix
    end  

    it "should collect fixed bikes from garage" do 
      van.collect_fixed_bikes(stub_garage)
      expect(van.bikes.count).to eq(1)  
      expect(stub_garage.bikes.count).to eq(0)
    end  

    it "should release fixed bikes to docking station" do 
      van.collect_fixed_bikes(stub_garage)
      van.release_fixed_bikes(station)
      expect(station.available_bikes.count).to eq(1)
    end  

end

end  