ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/haml'
require 'capybara/dsl'

module TestHelpers
  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    db = YAML::Store.new('db/robots_test')
    @robot_manager ||= RobotManager.new(db)
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
