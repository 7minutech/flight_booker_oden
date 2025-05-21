class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_num = params[:ticket_num].to_i
    @passenger_num.times do
      @booking.passengers.build
    end
  end
end
