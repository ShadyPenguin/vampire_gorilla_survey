############# GET ##############
get '/' do
  # log-in sign up screen
  erb :index
end

get '/sign_up' do 
  # sign up pge
  erb :sign_up
end

get '/profile/:id' do 
  # create survey button & lists of surveys below
  @user = User.find(params[:id])
  erb :profile
end

get '/survey/:id/:question_number' do
  @survey = Survey.find(params[:id])
  @number = params[:question_number].to_i
  erb :survey
  # result of each survey
end 

get '/create_survey' do 
  # create survey
  @user = User.find(session[:user_id])
  erb :create_survey 
end 

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey_link
  # displays link to (just) created survey for survey taker to take survey
end

############# POST #############

post '/log_in' do 
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/profile/#{user.id}"
  end 
  redirect '/'
end 


post '/sign_up' do
  user = User.create(email: params[:email],username: params[:username], password: params[:password])
  if user.valid?
    session[:user_id] = user.id
    redirect "/profile/#{user.id}"
  else
    redirect "/sign_up"
  end
end

post '/create_survey' do
  new_survey = Survey.create(name: params[:name])
  User.find(session[:user_id]).surveys << new_survey
  number = params[:number]
  redirect "/survey/#{new_survey.id}/#{number}"
end

post "/survey/:id/:counter" do
  counter = 1
  survey = Survey.find(params[:id])
  user = survey.user
  params[:counter].to_i.times do 
    name = "q_#{counter}"
    survey.questions << Question.new(title: params["#{name}"])
    counter += 1
    end
    survey.questions.each do |q|
      q.choices << Choice.new(possible_response: "Strongly Agree")
      q.choices << Choice.new(possible_response: "Agree")
      q.choices << Choice.new(possible_response: "Neutral")
      q.choices << Choice.new(possible_response: "Disagree")
      q.choices << Choice.new(possible_response: "Totally Disagree")
    end
  redirect "/profile/#{user.id}"
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


