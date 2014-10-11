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

get 'api/coach/:id' do
  content_type :json
  
  if coach = Coach.get(params[:id])
  coach.to_json  
  else
    json_status 404 "Not Found"
end

post 'api/coach/new' do
  content_type :json
  
  coach_json = JSON.parse request.body.read
  coach = Coach.new(coach_json)
  if coach.save
  else
    json_status 404 "Not Found"
  
end

put 'api/coach/edit' do
  content_type :json

  if coach = Coach.get(params[:id])
    coach
    coach.save
  else
    json_status 404 "Not Found"
end

delete 'api/coach/:id' do
  content_type :json
  
  if coach = Coach.get(params[:id])
    coach.destroy
  else
    json_status 404 "Not Found"
end

