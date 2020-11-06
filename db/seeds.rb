# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tables = ActiveRecord::Base.connection.tables - ['schema_migrations']

# In PostgreSQL, it does not do this automatically. You can use TRUNCATE TABLE table RESTART IDENTITY;
# tables.each do |table|
#   ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
# end

# In SQLite, there is no TRUNCATE statement, instead, it's
tables.each do |table|
  ActiveRecord::Base.connection.execute "DELETE FROM `#{table}`"
  ActiveRecord::Base.connection.execute "DELETE FROM sqlite_sequence WHERE name='#{table}'"
end

airports = Airport.create([
  { code: 'SFO' },
  { code: 'NYC' }
])

flights = Flight.create([
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2020-12-25 07:00:00"},
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2020-12-25 09:00:00"},
  { from_airport_id: airports.first.id, to_airport_id: airports.last.id, duration: 320, scheduled_on: "2020-12-25 11:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 385, scheduled_on: "2020-12-26 07:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 385, scheduled_on: "2020-12-26 09:00:00"},
  { from_airport_id: airports.last.id, to_airport_id: airports.first.id, duration: 385, scheduled_on: "2020-12-26 11:00:00"}
])
