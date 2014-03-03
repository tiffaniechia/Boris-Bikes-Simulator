require '../lib/boris_bike'

describe Bike do 

	let(:bike) {Bike.new}

	it "should not be broken after we create it" do 
		bike = Bike.new
		expect(bike).not_to be_broken
		#expect(bike.broken?).to be_false
	end

	it "should be able to break" do 
		bike = Bike.new 
		bike.break
		expect(bike).to be_broken
	end
	

	it "should be able to get fixed" do 
		bike = Bike.new
		bike.break
		bike.fix
		expect(bike).not_to be_broken
	end
	

end

describe Dockingstation do 

	let(:bike) {Bike.new}
	let(:station) {Dockingstation.new}

	def fill_station(station)
		10.times {station.dock(Bike.new)}
	end

	it "should accept a bike" do
		expect(station.bike_count).to eq (0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
	end
		
	it "should release a bike" do 
		 station.dock(bike)
		 station.release(bike)
		 expect(station.bike_count).to eq(0)
	end	 

	it "should know when its full" do 
		expect(station).not_to be_full
		fill_station station
		expect(station).to be_full
	end	

	it "should not accept a bike if its full" do 
		fill_station station
		expect(lambda {station.dock(bike)}).to raise_error(RuntimeError)
	end	

	it "should provide the list of available bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end	

end	
