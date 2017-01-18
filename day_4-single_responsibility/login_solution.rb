User.new.login
Text.new.get_text




class User
	def login
		user_data = UserData.get_data
		while !Autenticator.autenticate(username,password)
			puts "Incorrect name or password"
			user_data = UserData.get_data
		end
	end
end

class UserData
	def self.get_data
	puts "Please, insert your username"
		username = gets.chomp
		puts "Please, insert your password"
		password = gets.chomp
		user_data = {username: username, password: password}
	end
end

class Autenticator
	def self.autenticate(username, password)
		if username == "dani" && password == "secret"
			true
		else
			false
		end
	end
end

class Text
	def get_text
	puts "Tipe in some text"
	text = gets.chomp
	end	
end

class Menu
	def show_menu

	end
end



class TextCounter
	def self.count_words(text)
		text.split(" ").length
	end
	
	def self.count_letters(text)
		text.split("").length
	end
end

class TextModifier
	def self.text_reverser(text)
		text.reverse
	end
	
	def self.text_upper(text)
		text.upcase
	end

	def self.text_downer(text)
		text.downcase
	end
end