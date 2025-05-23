class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  validates :start_timestamp, presence: true
  validates :flight_duration, presence: true

  scope :ordered_timestamps, -> { Flight.all.order(:start_timestamp) }

  def formatted_date
    start_timestamp.strftime("%m/%d/%Y")
  end

  def formatted_time
    start_timestamp.strftime("%I:%M %p")
  end

  def self.formatted_date_str(date)
    year = date[0..3]
    month = date[5..6]
    day = date[8..9]
    new_date = "#{month}/#{day}/#{year}"
    new_date
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

  def self.on(dept_id, arrive_id, date)
    Flight.where("departure_airport_id = ? and arrival_airport_id = ?
                  and DATE(start_timestamp) = ?", dept_id, arrive_id, Date.parse(date))
  end
end
