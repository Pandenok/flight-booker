class AirportsController < ApplicationController
  include AirportsHelper
  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)
    @airport.save
    flash[:success] = "Airport #{@airport.code} successfully created!"
    redirect to root_path
  end
end
