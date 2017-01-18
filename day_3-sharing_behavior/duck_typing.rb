class Truck
	attr_reader :noise, :wheels

	def initialize
		@wheels = 16
		@noise = "BBBRRROOOOOMMMM"
	end 
end


class Bike
	attr_reader :noise, :wheels

	def initialize
		@wheels = 2
		@noise = "ñecñec"
	end 
end


class MotorBike
	attr_reader :noise, :wheels

	def initialize
		@wheels = 16
		@noise = "bbbbbbbbbrrrrrrr"
	end 
end


class WheelCounter
	def self.count_wheels(vehicles)
		vehicles.reduce(0) do |sum, item|
			sum + item.wheels
		end
	end
end


class NoisePrinter
	def self.print_noises(vehicles)
		vehicles.reduce("") do |sum, item|
			sum + item.noise + " "
		end
	end
end



vehicles = [Truck.new, Bike.new, MotorBike.new]

p WheelCounter.count_wheels(vehicles)
p NoisePrinter.print_noises(vehicles)