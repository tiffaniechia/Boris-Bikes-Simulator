require_relative "../lib/bike"

describe Bike do

  it "should not be broken after we create it" do
    bike = Bike.new
    # expect(bike).not_to be_broken
    expect(bike.broken?).to be_false
  end  

end