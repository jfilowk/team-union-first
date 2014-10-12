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

get '/api/team/:id' do
  content_type :json
  
  if team = Team.get(params[:id])
    team.to_json
  else
    json_status 404, "Not Found"
  end
end

post '/api/team/new' do
  content_type :json
  
  team_json = JSON.parse request.body.read
  team = Team.new(team_json)
  
  if team.save
    team = Team.last
    status 201
    team.to_json
  else
    json_status 404, "Not Found"
  end
end

put '/api/team/edit' do
  content_type :json
  team_json = JSON.parse body.request.read
  
  team ||= Team.get(team_json["id"]) || halt(404)
    halp 500 unless team.update(
      name: team_json['name']
    )  
  team.to_json
  
end

delete '/api/team/:id' do
  content_type :json
  
  if team = Team.get(params[:id])
    team.destroy!
    status 204
  else
    json_status 404, "Not Found"
  end
  
end  