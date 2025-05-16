class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_timestamp, presence: true
  validates :flight_duration, presence: true
  validates :arrival_airport_id, comparison: { other_than: :departure_airport_id }
end
