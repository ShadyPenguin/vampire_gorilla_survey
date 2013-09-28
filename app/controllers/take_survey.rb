

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


get '/showgraph/:questionid' do 
  @question = Question.find(params[:questionid])
  @strongly_agree = @question.choices[0].responses.count
  @agree = @question.choices[1].responses.count
  @neutral = @question.choices[2].responses.count
  @disagree = @question.choices[3].responses.count
  @strongly_disagree = @question.choices[4].responses.count
  erb :chart
end 
