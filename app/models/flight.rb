class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_timestamp, presence: true
  validates :flight_duration, presence: true
end
