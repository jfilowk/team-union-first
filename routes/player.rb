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

get '/api/player/:id' do
  context_type :json
  
  if player = Player.get(params[:id])
    player.to_json
  else
    json_status 404, "Not Found"
  end
end

post '/api/player/new' do
  context_type :json
  
  player_json = JSON.parser body.request.read  
  player = Player.new(player_json)
  
  if player.save
    coach = Coach.last
    status 201
    player.to_json
  else
    json_status 404, "Not Found"
  end
end

put '/api/player/edit' do
  context_type :json
  player_json = JSON.parser request.body.read
  
  player ||= Player.get(player_json["id"]) || halt(404)
  halp 500 unless player.update (
  firstName: player_json['firstName'],
  lastName: player_json['lastName'],
  number: player_json['number']
  )
  player.to_json
  
end

delete '/api/player/:id' do
  context_type :json
  
  if player = Player.get(params[:id])
    player.destroy!
    status 204
  else
    json_status 404, "Not Found"
  end
  
end