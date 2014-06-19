require 'sinatra'
require 'sinatra/activerecord'

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
end

get '/' do
  @title = "Hello World"
  erb :index
end

get '/challenges/:id' do
  erb :show
end

post '/challenges' do
  # do something
end
