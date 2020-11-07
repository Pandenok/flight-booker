class FlightsController < ApplicationController
  include FlightsHelper
  def index
    @flights = Flight.all
    selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @available_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], scheduled_on: selected_date.all_day)
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    flash[:success] = "Flight was successfully created!"
    redirect_to root_path
  end
end
