class TrefleService

  def filter(ph, light)
    plants = []
    page_number = 1
      until plants.length > 50 do
      if ph == 0.0
        light_response = conn.get("/api/v1/plants?range[light]=#{light - 2},#{light + 2}&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info << JSON.parse(light_response.body, symbolize_names: true)

        plants_info[:data].each do |plant|
          plants << plant
        end

        page_number += 1
      else
        ph_response = conn.get("/api/v1/plants?range[ph_minimum]=#{ph - 2}&,range[ph_maximum]=#{ph + 2}&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info = JSON.parse(ph_response.body, symbolize_names: true)

        plants_info[:data].each do |plant|
          individual_plant_response = conn.get("#{plant[:links][:self]}?token=#{ENV['TREFLE_ID']}")
          individual_plant_info = JSON.parse(individual_plant_response.body, symbolize_names: true)
            plant_object = Plant.new(individual_plant_info)
          plants << plant_object
        end

        page_number += 1
      end
    end
    require"pry"; binding.pry
    plants
  end

  private

  def conn
    Faraday.new(url: 'https://trefle.io')
  end
end
