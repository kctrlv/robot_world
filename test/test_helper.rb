ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'

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
