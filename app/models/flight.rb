class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :start_timestamp, presence: true
  validates :flight_duration, presence: true

  scope :ordered_timestamps, -> { Flight.all.order(:start_timestamp) }

  def formatted_date
    start_timestamp.strftime("%m/%d/%Y")
  end

  def self.unique_ordered_dates
    flight_dates = {}
    ordered_timestamps.each do |flight|
      unless flight_dates[flight.start_timestamp.strftime("%Y-%m-%d")]
        flight_dates[flight.start_timestamp.strftime("%Y-%m-%d")] = flight.start_timestamp.strftime("%m/%d/%Y")
      end
    end
    flight_dates
  end
end
