require 'pry'
class Car
	
	def initialize (noise, engine)
		@noise = noise
		@engine = engine
	end

	def make_noise
		@noise + @engine.noise
	end

end

class Engine
	attr_reader :noise
	def initialize (type)
		@type = type
		if type == "diesel"
			@noise = "brrrrrrrrr"
		elsif type == "electric"
			@noise = "zzzzzzzzzzz"
		else
			@noise = "brrrrruuummm"
		end
	end
	
	# def make_noise
	# 	@noise
	# end

end

bad_engine = Engine.new("diesel")
fast_car = Car.new("Yum", bad_engine)
p fast_car.make_noise
