namespace :flights do
  desc "seed flights for airports"
  task seed_flights: :environment do
    Airport.all.each do |airport|
      airport.arriving_flights.destroy_all
      airport.departing_flights.destroy_all
    end
    Airport.find_each do |airport|
      10.times do
        Airport.all.each do |arrival_airport|
          next if airport.id == arrival_airport.id
          flight_time = Faker::Time.between(from: Time.now, to: 7.days.from_now)
          flight_duration = Faker::Number.between(from: 30, to: 1200)
          departing_flight = airport.departing_flights.build(
            departure_airport: airport,
            arrival_airport: arrival_airport,
            start_timestamp: flight_time,
            flight_duration: flight_duration
          )
          departing_flight.save!
        end
      end
    end
  end
end
