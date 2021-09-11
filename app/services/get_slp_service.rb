class GetSlpService
  def run(record: true)
    Scholar.all.each do |scholar|
      total = slp_total(scholar)
      SlpLog.create!(total: total, scholar: scholar) if record
    end
  end

  private

  def slp_total(scholar)
    resp = RestClient.get(slp_url(scholar.ronin_wallet_id))
    body = JSON.parse(resp.body)

    slp_total = body['total']

    puts "#{scholar.discord_name}: #{slp_total}"

    slp_total
  end

  def slp_url(ronin_id)
    "https://game-api.skymavis.com/game-api/clients/#{ronin_id}/items/1"
  end
end
