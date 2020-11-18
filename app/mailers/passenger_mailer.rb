class PassengerMailer < ApplicationMailer
  default from: 'confirmations@example.com'

  def confirmation_email(passenger)
    @passenger = passenger
    
    mail(to: @passenger.email, subject: 'Confirmation FlightBooker')
  end
end
