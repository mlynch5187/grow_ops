class TrefleService

  def filter(ph, light)
    if ph == 0.0
      plants = conn.get("/species?token=#{ENV['TREFLE_ID']}&range[light]=#{light - 2},#{light + 2}")
    else
      plants = conn.get("/species?token=#{ENV['TREFLE_ID']}&range[ph_minimum]=#{ph - 2}&.range[ph_maximum]=#{ph + 2}")
    end
    JSON.parse(plants.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://trefle.io/api/v1')
  end
end
