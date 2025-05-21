class FlightsController < ApplicationController
  def index
    @departure_airports = Airport.all.map { |airport| [ airport.code, airport.id ] }
    @arrival_airports = Airport.all.map { |airport| [ airport.code, airport.id ] }
    @passenger_numbers = (1..4).map { |num| [ num, num ] }
    @flight_dates = Flight.unique_ordered_dates.map { |k, v| [ v, k ] }
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:flight_date].present?
      @available_flights = Flight.on(params[:departure_airport_id], params[:arrival_airport_id], params[:flight_date])
    end
  end
end
