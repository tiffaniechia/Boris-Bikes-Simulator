require_relative "../lib/bike_container"

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new}

  it "should accept a bike" do 
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end 

end  