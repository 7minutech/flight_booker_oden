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
    formatted_dates = ordered_timestamps.map { |flight| flight.formatted_date }
    unique_formatted_dates = formatted_dates.uniq
    unique_formatted_dates
  end
end
