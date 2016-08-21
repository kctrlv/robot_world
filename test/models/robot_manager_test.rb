require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_manager.all.last.id
  end

  def create_robot(name, city, state, bd, dept, dh)
    robot_manager.create({
      "name" => name,
      "city" => city,
      "state" => state,
      "birthdate" => bd,
      "department" => dept,
      "date_hired" => dh})
  end

  def test_it_creates_a_robot
    create_robot("Bob", "Bobland", "CA", "01/01/1986", "Babysitting", "01/01/2016")
    robot = robot_manager.find(current_robot_id)
    assert_equal "Bob", robot.name
    assert_equal "Bobland", robot.city
    assert_equal "CA", robot.state
    assert_equal "01/01/1986", robot.birthdate
    assert_equal "Babysitting", robot.department
    assert_equal "01/01/2016", robot.date_hired
  end

  def test_it_returns_all_robots
    create_robot("Adam", "Adamland", "AL", "01/01/1986", "Accounting", "01/01/2016")
    create_robot("Bob", "Bobland", "CA", "01/01/1986", "Babysitting", "01/01/2016")
    assert_equal 2, robot_manager.all.length
    assert_instance_of Robot, robot_manager.all.last
    assert_equal "AL", robot_manager.all.first.state
    assert_equal "Babysitting", robot_manager.all.last.department
  end

  def test_it_updates_a_robot
    create_robot("Adam", "Adamland", "AL", "01/01/1986", "Accounting", "01/01/2016")
    # sleep(1)
    assert_equal "Accounting", robot_manager.all.first.department
    assert_equal current_robot_id, robot_manager.all.first.id
    update_data = {
      name: "Adam",
      city: "Adamland",
      state: "CA",
      birthdate: "01/01/1986",
      department: "Agriculture",
      date_hired: "01/01/2016" }
    robot_manager.update(current_robot_id, update_data)
    # sleep(1)
    assert_equal current_robot_id, robot_manager.all.first.id
    assert_equal "Agriculture", robot_manager.all.first.department
    assert_equal "CA", robot_manager.all.first.state
  end

  def test_it_destroys_a_robot
    create_robot("Adam", "Adamland", "AL", "01/01/1986", "Accounting", "01/01/2016")
    create_robot("Bob", "Bobland", "CA", "01/01/1986", "Babysitting", "01/01/2016")
    assert_equal 2, robot_manager.all.length
    assert_equal "Bob", robot_manager.all.last.name
    robot_manager.destroy(current_robot_id)
    assert_equal 1, robot_manager.all.length
    assert_equal "Adam", robot_manager.all.last.name
  end
end
