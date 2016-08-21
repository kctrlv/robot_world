require 'sqlite3'

envs = ["test", "development"]

envs.each do |env|
  db = SQLite3::Database.new("db/robots_#{env}.db")
  db.execute("CREATE TABLE robots (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64),
    city VARCHAR(64),
    state VARCHAR(64),
    birthdate VARCHAR(64),
    department VARCHAR(64),
    date_hired VARCHAR(64)
    );")
  puts "creating robots table for #{env}"
end
