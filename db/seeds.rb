# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[ "SFO", "NYC", "LAX", "ONT" ].each do |name|
  Airport.find_or_create_by!(name: name)
end

5.times do |i|
  flight=Flight.new(start: Date.current.advance(days: i), duration: i+1)
  Airport.find(i%4+1).departing_flights.push(flight)
  Airport.find((i+1)%4+1).arriving_flights.push(flight)
  flight=Flight.new(start: Date.current.advance(days: i), duration: i+1)
  Airport.find(i%4+1).departing_flights.push(flight)
  Airport.find((i+1)%4+1).arriving_flights.push(flight)
  flight=Flight.new(start: Date.current.advance(days: i+1), duration: i+1)
  Airport.find(i%4+1).departing_flights.push(flight)
  Airport.find((i+1)%4+1).arriving_flights.push(flight)
end
