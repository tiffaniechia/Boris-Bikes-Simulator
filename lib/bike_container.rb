module BikeContainer
	DEFAULT_CAPACITY =10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end 

	def bike_count
		bikes.count
	end	

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
	end	

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end	

	def accept(bike)
		bike.fix
		dock(bike)
	end	
		
end