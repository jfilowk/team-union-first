# encoding: UTF-8

helpers do
  def json_status(code, reason)
    status code
    {
      :status => code,
      :reason => reason
    }.to_json
  end
end
  
get '/api/coach/:id' do
  content_type :json
  
  if coach = Coach.get(params[:id])
    coach.to_json
  else
    json_status 404, "Not Found"
  end
end

post '/api/coach/new' do
  content_type :json
  
  coach_json = JSON.parse request.body.read
  coach = Coach.new(coach_json)
  
  if coach.save
    coach = Coach.last
    status 201
    coach.to_json
  else
    json_status 400, "Not Created"
  end
end

put '/api/coach/edit' do
  content_type :json
  coach_json = JSON.parse request.body.read
  
  if coach = Coach.get(coach_json["id"])
    coach = Coach.update(
    firstName: coach_json["firstName"],
    lastName: coach_json["lastName"],
    password: coach_json["password"]
    )
    coach.to_json
  else
    json_status 404, "Not Found"
  end

end

delete '/api/coach/:id' do
  content_type :json
  
  if coach = Coach.get(params[:id])
    coach.destroy!
    status 204
  else
    json_status 404, "Not Found"
  end
  
end