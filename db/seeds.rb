require 'sqlite3'

db = SQLite3::Database.new("db/robots_development.db")
db.execute("DELETE FROM robots")

db.execute("INSERT INTO robots
  (name, city, state, birthdate, department, date_hired)
  VALUES
    ('Adam', 'A-city', 'A-state', '01/01/1986', 'Accounting', '08/01/2016'),
    ('Bora', 'B-city', 'B-state', '01/02/1986', 'Business', '08/02/2016'),
    ('Cole', 'C-city', 'C-state', '01/03/1986', 'Calligraphy', '08/03/2016');")

puts "It worked and: "
p db.execute("SELECT * FROM robots;")
