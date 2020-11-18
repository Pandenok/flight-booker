# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email_preview
    PassengerMailer.confirmation_email(Passenger.first)
  end
end
