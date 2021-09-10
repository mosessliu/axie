class GetSlpService
  def run
    ''
  end
end

require 'rest-client'
require 'json'

Scholar = Struct.new(:id, :ronin_id, :discord_name)

SCHOLARS = [
  Scholar.new(1, '0x79028e8987642e3898cfbcb212f7dbc166047588', 'jpc'),
  Scholar.new(2, '0x8b27daa7acfb16e16e412a3e1f632f17d69d4d6b', 'tyler')
]

def slp_url(ronin_id)
  "https://game-api.skymavis.com/game-api/clients/#{ronin_id}/items/1"
end

SCHOLARS.each do |scholar|
  resp = RestClient.get(slp_url(scholar.ronin_id))
  body = JSON.parse(resp.body)

  slp_total = body['total']

  puts "#{scholar.discord_name}: #{slp_total}"
end
