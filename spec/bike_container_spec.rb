require_relative "../lib/bike_container"

class ContainerHolder; include BikeContainer; end

describe BikeContainer do 

  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new}

  def fill_holder(holder)
    holder.capacity.times{holder.dock(Bike.new)}
  end  

  it "should accept a bike" do 
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end 

  it "should be able to release a bike" do 
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end  

  it "should know when it is full" do 
    fill_holder(holder)
    expect(holder.full?).to be_true
  end  

  it "should not accept a bike when it is full" do 
    fill_holder(holder)
    expect(lambda{holder.dock(bike)}).to raise_error(RuntimeError)
  end  


  it "should not release a bike if it is empty" do 
    expect(holder.bike_count).to eq(0)
    expect{holder.release(bike)}.to raise_error(RuntimeError)
  end

  context "working with different bike conditions" do

    before do 
      @working_bike, @broken_bike = Bike.new, Bike.new
      @broken_bike.break
      holder.dock(@working_bike)
      holder.dock(@broken_bike)
    end  

    it "should provide list of available bikes" do 
      expect(holder.available_bikes).to eq([@working_bike])
    end 

    it "should release broken bikes for purposes of van" do 
      expect(holder.broken_bikes).to eq([@broken_bike])
    end  
    
  end  

end  