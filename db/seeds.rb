require 'faker'

#user
username = Faker::Internet.user_name(name = nil)
password = Faker::Lorem.word
name = Faker::Name.first_name
email = Faker::Internet.email


#survey
survey_name = Faker::Company.bs

#question
title = Faker::Company.catch_phrase

#choice
possible_response = ["Strongly agree", "Agree", "Neutral", "Disagree", "Strongly disagree"].sample

#response

10.times do 

  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Lorem.word)
end

20.times do

  Survey.create(user_id: rand(1..10), name: Faker::Company.catch_phrase)
end

40.times do

  Question.create(survey_id: rand(1..20), title: Faker::Company.catch_phrase)
end

80.times do

  Choice.create(question_id: rand(1..40), possible_response: ["Strongly agree", "Agree", "Neutral", "Disagree", "Strongly disagree"].sample)

end

140.times do
  Response.create(choice_id: rand(1..80), question_id: rand(1..40))
end
