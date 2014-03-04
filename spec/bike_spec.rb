require '../lib/bike'

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


