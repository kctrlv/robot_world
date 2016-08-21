require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
                        "name" => "Bob",
                        "city" => "Bobland",
                        "state" => "CA",
                        "birthdate" => "01/01/1986",
                        "department" => "Babysitting",
                        "date_hired" => "01/01/2016"
                      })
    assert_equal "Bob", robot.name
    assert_equal "Bobland", robot.city
    assert_equal "CA", robot.state
    assert_equal "01/01/1986", robot.birthdate
    assert_equal "Babysitting", robot.department
    assert_equal "01/01/2016", robot.date_hired

  end
end
