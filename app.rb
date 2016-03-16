require 'sinatra'
require 'sinatra/activerecord'
require 'pry'

enable :sessions

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
end

get '/' do
  erb :index
end

get '/challenge' do
  session[:right] ||= 0
  session[:wrong] ||= 0

  @challenge = Challenge.approved.sample
  @question = Challenge.questions.sample.to_s

  erb :challenge
end

post '/challenge' do
  @challenge = Challenge.find(params[:challenge_id])
  @question = params[:question]
  @correct_answer = @challenge.send(@question)

  @result = @challenge.correct?(params[:question], params[:submission])
  if @result
    session[:right] += 1
  else
    session[:wrong] += 1
  end

  erb :challenge_response
end

get '/help' do
  erb :help
end

post '/help' do
  params[:subject] = params[:subject].titleize.gsub(' ', '')
  @challenge = Challenge.create(subject: params[:subject])
  erb :help_response
end

get '/about' do
  erb :about
end

not_found do
  erb :dne
end

error do
  erb :err
end
