module AirportsHelper
  def airport_params
    params.require(:airport).permit(:code)
  end
end
