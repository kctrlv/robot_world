require_relative '../test_helper'

class UserCreatesRobotTest < FeatureTest
  def test_user_creates_robot
    visit '/'
    within "ul" do
      click_link 'New Robot'
    end
    fill_in('robot[name]', with: 'Harvey')
    fill_in('robot[city]', with: 'Dallas')
    fill_in('robot[state]', with: 'TX')
    fill_in('robot[birthdate]', with: '11/22/1963')
    fill_in('robot[department]', with: 'Classified')
    fill_in('robot[date_hired]', with: '11/22/1963')
    click_button('Create')
    assert page.has_content?('Our Robots')
    assert page.has_content?('Harvey')
    click_link "Harvey"
    assert page.has_content?('This is a robot named Harvey. It was manufactured in the great city of Dallas, TX on 11/22/1963. It was put into operation in the Classified department as soon as possible, which was reportedly on 11/22/1963.')
  end
end
