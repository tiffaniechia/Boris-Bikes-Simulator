require_relative "../lib/bike"

describe Bike do

  it "should not be broken after we create it" do
    bike = Bike.new
    expect(bike.broken?).to be_false
  end  

  it "should be able to break" do 
    bike = Bike.new
    bike.break
    expect(bike.broken?).to be_true
  end
    

end