class PassengerMailer < ApplicationMailer
  default from: 'confirmations@example.com'

  def confirmation_email(passenger)
    @passenger = passenger
    @departure_airport = @passenger.booking.flight.from_airport.code
    @arrival_airport = @passenger.booking.flight.to_airport.code
    @selected_date = @passenger.booking.flight.scheduled_on.strftime('%B %d, %Y')
    @scheduled_time = @passenger.booking.flight.scheduled_on.strftime('%H:%M')
    @arrival_time = (@passenger.booking.flight.scheduled_on + (@passenger.booking.flight.duration/60).to_i.hours).strftime('%H:%M')

    mail(to: @passenger.email, subject: 'Confirmation FlightBooker')
  end
end
