class Login

	def initialize (username, password)
		@username = username
		@password = password
	end

	def get_login
		puts "Please, insert your username"
		@username = gets.chomp
		puts "Please, insert your password"
		password = gets.chomp
		password
	end

	def compare_password
		init_pass = get_login
		validation = nil
		if @password == init_pass
			validation = true
		end
		validation
	end

	def 

end


class Text
	def initialize (text)
		@text = text
	end
end