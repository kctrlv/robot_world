require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_all_robots
    robot_manager.create({
      "name" => "Adam",
      "city" => "Adamolis"
    })

    robot_manager.create({
      "name" => "Bob",
      "city" => "Bobland"
    })
    visit '/'
    within "ul" do
      click_link 'Our Robots'
    end
    assert page.has_content?('Our Robots')
    assert page.has_content?('Adam')
    assert page.has_content?('Bob')
    refute page.has_content?('Chris')
  end
end
