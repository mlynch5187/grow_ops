class TrefleService
  def filter(ph, light)
    plants = []

    if ph == 0.0
      light_response = conn.get("/api/v1/plants?filter[vegetable]=true&range[light]=#{light - 2},#{light + 2}&token=#{ENV['TREFLE_ID']}&page=1")
      plants_info = JSON.parse(light_response.body, symbolize_names: true)
      plants_info[:data].each do |plant|
        plants << plant
      end
      if plants_info[:data].length == 20
        light_response = conn.get("/api/v1/plants?filter[vegetable]=true&range[light]=#{light - 2},#{light + 2}&token=#{ENV['TREFLE_ID']}&page=2")
        plants_info = JSON.parse(light_response.body, symbolize_names: true)
        plants_info[:data].each do |plant|
          plants << plant
        end
      end
    else
      ph_response = conn.get("/api/v1/plants?filter[vegetable]=true&range[ph_maximum]=#{ph - 2},#{ph + 2}&token=#{ENV['TREFLE_ID']}&page=1")
      plants_info = JSON.parse(ph_response.body, symbolize_names: true)
      plants_info[:data].each do |plant|
        plants << plant
      end
      if plants_info[:data].length == 20
        ph_response = conn.get("/api/v1/plants?filter[vegetable]=true&range[ph_maximum]=#{ph - 2},#{ph + 2}&token=#{ENV['TREFLE_ID']}&page=2")
        plants_info = JSON.parse(ph_response.body, symbolize_names: true)
        plants_info[:data].each do |plant|
          plants << plant
        end
      end  
    end
    plants
  end

  def plant_details(plant_ids)
    plant_ids.map do |plant_id|
      individual_plant_response = conn.get("/api/v1/plants/#{plant_id.to_i}?token=#{ENV['TREFLE_ID']}")
      individual_plant_info = JSON.parse(individual_plant_response.body, symbolize_names: true)
      PlantObject.new(individual_plant_info)
    end
  end

  private

  def conn
    Faraday.new(url: 'https://trefle.io')
  end
end
