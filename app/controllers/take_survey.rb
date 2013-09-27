

get '/take_survey/:surveyid' do
  @survey = Survey.find(params[:surveyid])
  erb :take_survey
end

post '/submit_survey/:surveyid' do 
  puts params[:question]
  choice_hash = params[:question]
  choice_hash.each do |k,v|
    Response.create(question_id: k, choice_id: v)
  end 
  erb :done
end 

get '/result/:surveyid' do 
  @survey = Survey.find(params[:surveyid])
  erb :result
end 
