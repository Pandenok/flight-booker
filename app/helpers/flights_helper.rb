module FlightsHelper
  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :duration, :scheduled_on)
  end
end
