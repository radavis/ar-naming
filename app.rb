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
  @question = Challenge.questions.sample.to_s
  erb :challenge
end

post '/challenge' do
  @challenge = Challenge.find(params[:challenge_id])
  @question = params[:question].to_sym
  @correct_answer = @challenge.try(@question)
  @result = (@correct_answer == params[:answer])
  erb :result
end
