class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthdate,
              :department,
              :date_hired,
              :avatar

  def initialize(data)
    @id = data['id']
    @name = data['name']
    @city = data['city']
    @state = data['state']
    @birthdate = data['birthdate']
    @department = data['department']
    @date_hired = data['date_hired']
    @avatar = make_unique_string
  end

  def make_unique_string
    "#{name}#{city}#{state}#{birthdate}#{date_hired}#{department}"
  end
end
