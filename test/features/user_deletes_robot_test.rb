require_relative '../test_helper'

class UserDeletesRobotTest < FeatureTest
  def test_user_deletes_robot
    robot_manager.create({
      "name" => "Adam",
      "city" => "Adamolis"
    })
    visit '/'
    within "ul" do
      click_link 'Our Robots'
    end
    assert page.has_content? "Adam"
    click_link "Adam"
    assert page.has_content? "Adamolis"
    click_button "Delete"
    refute page.has_content? "Adam"
  end
end
