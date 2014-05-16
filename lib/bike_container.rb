module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes 
    @bikes ||= []
  end  

  def capacity 
    @capcity ||= DEFAULT_CAPACITY
  end
  
  def capacity=(value)
    @capcity = value
  end  

  def bike_count
    bikes.count
  end  

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end  

  def release(bike)
    bikes.delete(bike)
  end  

  def full? 
    bike_count == capacity
  end  

  def available_bikes
    @bikes.reject {|bike| bike.broken?}
  end  

end  