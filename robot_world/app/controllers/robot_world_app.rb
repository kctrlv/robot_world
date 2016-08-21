require 'models/robot_manager'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    haml :home
  end

  get '/robots' do
    @robots = robot_manager.all
    haml :index
  end

  get '/robots/new' do
    haml :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    haml :show
  end

  get '/robots/:id/edit' do |id|
  @robot = robot_manager.find(id.to_i)
  erb :edit
end

  def robot_manager
    db = YAML::Store.new('db/robots')
    @robot_factory ||= RobotManager.new(db)
  end
end
