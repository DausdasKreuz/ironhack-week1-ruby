require 'pry'

class Game
	def initialize (rooms, mapa, initial_room)
		@instructions = "Pendiente de rellenar"
		@rooms = rooms
		@mapa = mapa
		@actual_room = initial_room
		@game_over = false
	end

	def play_game
		puts @instructions
		@actual_room.init_room

		while !@game_over
			order = get_order
			change_room(order)
			
		end
	end

	def get_order
		order = gets.chomp.downcase
		if order == "game over"
			@game_over = true
		elsif order == "instructions"
			puts @instructions
		end
		order
	end

	def change_room(order)
		if @actual_room.directions[order.to_sym]
			@actual_room = mapa[@actual_room.to_sym][order.to_sym]
		else
			
		end
	end
end



class Room 
	attr_reader :doors
	def initialize (description, doors={})
		@description = description
		@doors = doors
		@directions = {n: "north", e: "east", s: "south", w: "west"}
	end

	def init_room
		print @description
		@doors.each do |k,v|
			if v
				print " You have a door at #{@directions[k]}."
			end
		end
		puts " "
		puts ">"
	end
end


room1 = Room.new("You are in room 1.", {n: true, e: false, s: false, w: false})
room2 = Room.new("You are in room 2.", {n: false, e: true, s: true, w: false})
room3 = Room.new("You are in room 3.", {n: true, e: false, s: false, w: true})
room4 = Room.new("You are in room 4.", {n: false, e: false, s: false, w: false})

rooms = {
	room1: room1,
	room2: room2,
	room3: room3,
	room4: room4
}

mapa = {
	room1: {n: room2, e: nil, s: nil, w: nil},
	room2: {n: nil, e: room3, s: room1, w: nil},
	room3: {n: room4, e: nil, s: nil, w: room2},
	room4: {n: nil, e: nil, s: room3, w: nil},
}

Game.new(rooms, mapa, rooms[:room1]).play_game