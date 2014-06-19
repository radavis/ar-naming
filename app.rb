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

get '/challenge' do
  @challenge = Challenge.all.sample
  erb :challenge
end

post '/challenge' do
  @challenge = Challenge.find(params[:challenge_id])
  @correct_answer = @challenge.table_name
  @result = (@correct_answer == params[:answer])
  erb :result
end
