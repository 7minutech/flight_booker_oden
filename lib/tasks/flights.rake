namespace :flights do
  desc "seed flights for airports"
  task seed_flights: :environment do
    Airport.find_each do |airport|
      airport.arriving_flights.destroy_all
      airport.departing_flights.destroy_all

      5.times do
        departing_to = Airport.where.not(id: airport.id).sample

        departing_flight = airport.departing_flights.build(
          departure_airport: airport,
          arrival_airport: departing_to,
          start_timestamp: Faker::Time.between(from: Time.now, to: 7.days.from_now),
          flight_duration: Faker::Number.between(from: 30, to: 1200)
        )
        departing_flight.save!

        departed_from = Airport.where.not(id: airport.id).sample

        arriving_flight = airport.arriving_flights.build(
          departure_airport: departed_from,
          arrival_airport: airport,
          start_timestamp: Faker::Time.between(from: Time.now, to: 7.days.from_now),
          flight_duration: Faker::Number.between(from: 30, to: 1200)
        )
        arriving_flight.save!
      end
    end
  end
end
