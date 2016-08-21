require_relative '../test_helper'

class UserEditsRobotTest < FeatureTest
  def test_user_edits_robot
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
    click_link "Edit"
    fill_in('robot[city]', with: 'Adamantia')
    click_button "Update"
    refute page.has_content? "Adamolis"
    assert page.has_content? "Adamantia"
  end
end
