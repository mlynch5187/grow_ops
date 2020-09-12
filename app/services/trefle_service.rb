class TrefleService

  def filter(ph, light)
    plants = []
    page_number = 1
      until plants.length > 50 do
      if ph == 0.0
        response = conn.get("/api/v1/plants?range[light]=#{light - 2},#{light + 2}&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info << JSON.parse(response.body, symbolize_names: true)

        plants_info[:data].each do |plant|
          plants << plant
        end

        page_number += 1
      else
        response = conn.get("/api/v1/plants?range[ph_minimum]=#{ph - 2}&,range[ph_maximum]=#{ph + 2}&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info = JSON.parse(response.body, symbolize_names: true)

        plants_info[:data].each do |plant|
          plants << plant
        end

        page_number += 1
      end
    end
    plants
  end

  private

  def conn
    Faraday.new(url: 'https://trefle.io')
  end
end
