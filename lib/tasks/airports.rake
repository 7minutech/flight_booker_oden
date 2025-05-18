namespace :airports do
  desc "seeds airports"

  task seed_airports: :environment do
    Airport.destroy_all

    5.times do
      Airport.create!(code: Faker::Travel::Airport.unique.iata(size: "large", region: "united_states"))
    end
  end
end
