class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight])
    @passengers_count = params[:pax].to_i
    @passengers_count.times { @booking.passengers.build }
  end

  def create
  end
end
