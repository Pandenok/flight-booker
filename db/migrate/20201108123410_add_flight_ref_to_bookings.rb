class AddFlightRefToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :flight, foreign_key: true
  end
end
