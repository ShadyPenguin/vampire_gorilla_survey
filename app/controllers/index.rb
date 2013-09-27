############# GET ##############
get '/' do
  # log-in sign up screen
  erb :index
end

get '/sign_up' do 
  # sign up pge
  erb :sign_up
end

get '/profile' do 
  # create survey button & lists of surveys below
end

get '/survey/:id' do
  # result of each survey
end 

get '/create_survey' do 
  # create survey 
end 

get '/survey/link' do
  # displays link to (just) created survey for survey taker to take survey
end

############# POST #############

post '/log_in' do 
  user = User.authenticate(params[:email], params[:password])
  if user.valid?
    session[:user_id] = user.id
    redirect '/profile'
  end 
  redirect '/'
end 


post '/sign_up' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/profile'
end

post '/create_survey' do
  # create survey
end


post '/take_survey/:survey_id' do 
  # take survey
end 


# post '/survey/:survey_id/create_question' do 
#   @survey = Survey.find(params(:survey_id))
#   erb :
# end 

# post '/survey/:survey_id/create_question/:question_id/create_choice' do 
#   @survey = Survey.find(params[:survey_id])
#   @question = Question.find(params[:question_id])
#   erb :
# end 


