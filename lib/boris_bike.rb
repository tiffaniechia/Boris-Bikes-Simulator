class Bike

	def initialize
	fix
	end	

	def broken?
	@broken
	end
	
	def break
	@broken = true
	end	

	def fix
	@broken = false
	end	

end

class Dockingstation

	def initialize
		@bikes = [] 
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		@bikes << bike
	end

end