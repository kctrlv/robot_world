require 'sqlite3'

class RobotManager
  attr_reader :db

  def initialize(db)
    @db = db
  end

  def create(robot)
    db.execute(
      "INSERT INTO robots
      (name, city, state, birthdate, department, date_hired)
      VALUES (?, ?, ?, ?, ?, ?);",
      robot['name'],
      robot['city'],
      robot['state'],
      robot['birthdate'],
      robot['department'],
      robot['date_hired'] )
  end

  def raw_robots
    db.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    raw_robots.find { |data| data['id'] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    db.execute(
      "UPDATE robots SET
      name= ?,
      city= ?,
      state= ?,
      birthdate= ?,
      department= ?,
      date_hired= ?
      ;",
      robot[:name],
      robot[:city],
      robot[:state],
      robot[:birthdate],
      robot[:department],
      robot[:date_hired] )
  end

  def destroy(id)
    db.execute("DELETE FROM robots WHERE id = ?;", id)
  end

  def delete_all
    db.execute("DELETE FROM robots;")
  end
end
