class Dog
	attr_accessor :name, :breed  # accessor = writer + reader
	attr_writer :sound


	def initialize (name, breed, sound)
		@name = name
		@breed = breed
		@sound = sound
		@@number_of_dogs ||= 0
		@@number_of_dogs += 1
	end

	def bark
		puts @sound
	end

	def self.number_of_dogs
		puts @@number_of_dogs
	end

	def track
		puts "sniff"
	end

	def smell(person)

		file = File.open(@name+".txt", "a")
		file.puts person
		file.close
	end

	def people_smelled
		file = File.open(@name+".txt", "r")
		people = file.readlines		# devuelve cada línea como elemento de un array
									# con file.readlines devuelve el contenido del fichero como un string
		file.close
		people
	end

end


class Hound < Dog
	attr_accessor :animal

	def initialize (name, breed, sound, animal)
		super(name, breed, sound)
		@animal = animal
	end

	def roll
		puts "Roll..."
	end

	def track
		puts "Sniiifffffff"
		super   #hace lo que aha el método tal y como está definido en el padre
	end

end


class PetDog < Dog
	attr_accessor :owner

	def initialize ( name, breed, sound, owner )
		super(name, breed, sound)
		@owner = owner
	end

	def fetch(toy)
		puts "*drop #{toy}* ... "
		bark
		bark
		bark 
	end

end


p1 = Dog.new("toby", "hotdog", "Wooof")
h1 = Hound.new("zaco", "chucho", "guau", "gato")
p2 = PetDog.new("perro", "chucho", "wuff", "yo")


p2.smell("Dani")
p2.smell("Mike")
p2.smell("Simon")
puts p2.people_smelled