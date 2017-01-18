require 'imdb'
require 'pry'

class MovieSearcher

	def initialize(filename)
		@movies ||= {} 
		@filename = filename
	end


	def search()
		movies = read_movies_file(@filename)
		movies.each do |movie|
			query = Imdb::Search.new(movie)
			@movies[movie.to_sym] = query.movies.first.rating 
		end
	end

	def fake_search()
		@movies = {
			:Ghostbusters => 5.4, 
			:"Die Hard" => 8.2,
			:"The Godfather" => 9.2,
			:"Home alone"=> 7.5,
			:"Star trek, the new generation" => 8.6,
			:"The night of the living dead" => 8.0,
			:Titanic => 7.7
		}
	end
	
	def print_movie_list
		i ||= 1
		@movies.each do |k,v|
			out = "#{i}. #{k.to_s.chomp}: #{v}"
			puts out
			i += 1
		end 
	end

	def print_rating
		10.times do |i|
			@movies.each do |k,v|
				(v >= 10-i) ? (print "|#") : (print "| ")
			end
			puts "|"
		end
		puts "---------------"
		@movies.size.times do |i|
			print "|#{i+1}"
		end
		puts "|\n\n"
	end

	private
	def read_movies_file(filename)
		file = File.open(filename, "r")
		movies = file.readlines
		file.close
		movies
	end

end



ms = MovieSearcher.new "movies.txt"
ms.search
#ms.fake_search
ms.print_rating
ms.print_movie_list