require 'yaml/store'
require_relative 'robot'

class RobotManager
  attr_reader :db

  def initialize(db)
    @db = db
  end

  def create(robot)
    db.transaction do
      db['robots'] ||= []
      db['total']  ||= 0
      db['total']   += 1
      robot_data = {
        'id' => db['total'],
        'name' => robot['name'],
        'city' => robot['city'],
        'state' => robot['state'],
        'birthdate' => robot['birthdate'],
        'department' => robot['department'],
        'date_hired' => robot['date_hired'] }
      db['robots'] << robot_data
    end
  end

  def raw_robots
    db.transaction do
      db['robots'] || []
    end
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
    db.transaction do
      target = db['robots'].find { |data| data['id'] == id }
      target['name'] = robot[:name]
      target['city'] = robot[:city]
      target['state'] = robot[:state]
      target['birthdate'] = robot[:birthdate]
      target['department'] = robot[:department]
      target['date_hired'] = robot[:date_hired]
    end
  end

  def destroy(id)
    db.transaction do
      db['robots'].delete_if { |robot| robot["id"] == id }
    end
  end
end
