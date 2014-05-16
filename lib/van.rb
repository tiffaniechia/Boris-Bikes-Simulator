class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end  

  def collect_broken_bikes(station)
    station.broken_bikes.each do |bike| 
      self.dock(bike)
      station.release(bike)
    end
  end  

  def release_broken_bikes(garage)
    self.broken_bikes.each do |bike|
      self.release(bike)
      garage.dock(bike)
    end  
  end  

  def collect_fixed_bikes(garage)
    garage.available_bikes.each do |bike|
      self.dock(bike)
      garage.release(bike)
    end  
  end  

  def release_fixed_bikes(station)
    self.available_bikes.each do |bike|
      self.release(bike)
      station.dock(bike)
    end 
  end  

end  