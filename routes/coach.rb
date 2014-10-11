# encoding: UTF-8

get '/api/coach/:id' do
  content_type :json
  
  coach = Coach.get(params[:id])
  coach.to_json  

end

post '/api/coach/new' do
  content_type :json
  
  coach_json = JSON.parse request.body.read
  coach = Coach.new(coach_json)
  coach.save
  
end

put '/api/coach/edit' do
  content_type :json
  coach_json = JSON.parse request.body.read
  
    coach = Coach.get(coach_json["id"])
    coach = Coach.update(
    firstName: coach_json["firstName"],
    lastName: coach_json["lastName"],
    password: coach_json["password"]
    )

end
delete '/api/coach/:id' do
  content_type :json
  
    coach = Coach.get(params[:id])
    coach.destroy!
  
end
