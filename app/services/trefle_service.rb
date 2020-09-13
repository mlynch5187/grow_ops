class TrefleService
  def filter(ph, light)
    plants = []
    page_number = 1
      until plants.length > 200 do
      if ph == 0.0
        ## be careful when calling the service, if you're trying to mess with ph params but you end up in ligh it might seem
        ## like your api mods aren't working right -- happened to me - Nick
        light_response = conn.get("/api/v1/plants?range[light]=#{light - 2},#{light + 2}&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info = JSON.parse(light_response.body, symbolize_names: true)

        plants_info[:data].each do |plant|
          plants << plant
        end

        page_number += 1
      else
        ### current filters - between 4inches - 8ft -- ph range -- edible = true -- conspicious(visible flowers) = true
        ph_response = conn.get("/api/v1/plants?range[maximum_height_cm]=10,250,range[ph_minimum]=#{ph - 2},range[ph_maximum]=#{ph + 2},filter[edible]=true,filter[conspicuous]=true&token=#{ENV['TREFLE_ID']}&page=#{page_number}")
        plants_info = JSON.parse(ph_response.body, symbolize_names: true)
        ### ask if we can eliminate this each block to speed up trefle api call
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

# plants.map do |plant|
#   individual_plant_response = conn.get("#{plant[:links][:self]}?token=#{ENV['TREFLE_ID']}")
#   individual_plant_info = JSON.parse(individual_plant_response.body, symbolize_names: true)
#   Plant.new(individual_plant_info)
#   # plants << plant_object
# end
