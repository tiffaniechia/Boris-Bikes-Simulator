class Bike

	def initialize
		@broken = false
	end	

	def broken?
	@broken
	end
	
	def break
	@broken = true
	end	

	def fixed
	@broken = false
	end	

end