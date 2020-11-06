class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.integer :duration
      t.datetime :scheduled_on

      t.timestamps
    end
  end
end
