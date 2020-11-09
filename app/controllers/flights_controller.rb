class FlightsController < ApplicationController
  include FlightsHelper

  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      if params[:from_airport_id].blank?
        flash.now[:alert] = "please choose departure airport"
      elsif params[:to_airport_id].blank?
        flash.now[:alert] = "please choose arrival airport"
      elsif params[:pax].blank?
        flash.now[:alert] = "please choose the number of passengers"
      elsif params[:from_airport_id] == params[:to_airport_id]
        flash.now[:alert] = "Please verify your choice"
      else
        selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @available_flights = Flight.where(from_airport_id: params[:from_airport_id], to_airport_id: params[:to_airport_id], scheduled_on: selected_date.all_day)
      end
    end 
  end
end
