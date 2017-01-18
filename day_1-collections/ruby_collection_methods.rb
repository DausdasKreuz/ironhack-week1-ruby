# collections (array, hash, enumerable) exercises
# each
pals = ["Jose", "Juan Pablo", "Miguel"]

pals.each do |pal|
  puts "Good morning, #{pal}"
end

pals.each { |pal| puts "Good morning, #{pal}" }

# map
cities = ["madrid", "barcelona", "miami"]

capitaliced_cities = cities.map do |city|
  city.capitalize
end

re_capitaliced_cities = cities.map { |city| city.capitalize }

p capitaliced_cities
p re_capitaliced_cities

# reduce
av_length_names = cities.reduce(0) do |sum, city|
  sum + city.length / cities.length
end

p av_length_names
