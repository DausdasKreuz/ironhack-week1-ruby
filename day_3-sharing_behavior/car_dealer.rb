require "pry"
class CarDealer
	
	def initialize (inventory={})  # si no se pasa parámetro, toma {} por defecto
		@inventory = inventory
	end

	def cars(brand)
		p @inventory[brand.to_sym]
	end

	def add_car (brand, model)
		@inventory[brand.capitalize.to_sym] ||= []   # aseguro que la marca existe ||=[] "lo primero y si no existe entonces lo segundo"
		@inventory[brand.capitalize.to_sym].push(model)
	end

	def showInventory
		@inventory.each do |brand, cars|
			print brand.to_s + ": "
			puts cars.join(", ")
		end
	end

end


inventory = {
	Ford: ["Fiesta", "Mustang"],
	Honda: ["Civic", "CR-V"]
}

car_dealer = CarDealer.new(inventory)

car_dealer.add_car("ford", "focus")
car_dealer.add_car("PEUGEOT", "206")

#car_dealer.cars("Ford")
car_dealer.showInventory