require File.expand_path("../../../config/environment", __FILE__)

describe Robot do
  attr_reader :robot

  before :each do
    @robot = Robot.new({
      "id" => 1,
      "name" => "Bob",
      "city" => "Bobland",
      "state" => "CA",
      "birthdate" => '01/01/1986',
      "department" => 'Babysitting',
      "date_hired" => '01/01/2016'
      })
  end

  # let!(:task) { Task.new("title" => "New Task")}

  it "has a id" do
    expect(robot.id).to eq(1)
  end

  it "has a name" do
    expect(robot.name).to eq("Bob")
  end

  it "has a city" do
    expect(robot.city).to eq("Bobland")
  end

  it "has a state" do
    expect(robot.state).to eq("CA")
  end

  it "has a birthdate" do
    expect(robot.birthdate).to eq("01/01/1986")
  end

  it "has a department" do
    expect(robot.department).to eq("Babysitting")
  end

  it "has a date_hired" do
    expect(robot.date_hired).to eq("01/01/2016")
  end
end
