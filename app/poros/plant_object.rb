class PlantObject

  def self.recommendations(zip, light)
    ph = find_ph(zip)
    TrefleService.new.filter(ph, light)
  end

  def self.plant_details(plants)
    TrefleService.new.plant_details(plants)
  end

  attr_reader :id,
              :name,
              :row_spacing,
              :spread,
              :edible,
              :images,
              :light,
              :ph_min,
              :ph_max,
              :days_to_harvest,
              :min_temp,
              :max_temp,
              :link_to_show_page

  def initialize(plant_info)
    @id                = plant_info[:data][:main_species][:id]
    @name              = plant_info[:data][:main_species][:common_name]
    @row_spacing       = plant_info[:data][:main_species][:growth][:row_spacing][:cm]
    @spread            = plant_info[:data][:main_species][:growth][:spread][:cm]
    @edible            = plant_info[:data][:main_species][:edible]
    @images            = plant_info[:data][:main_species][:images]
    @light             = plant_info[:data][:main_species][:growth][:light]
    @ph_min            = plant_info[:data][:main_species][:growth][:ph_minimum]
    @ph_max            = plant_info[:data][:main_species][:growth][:ph_maximum]
    @days_to_harvest   = plant_info[:data][:main_species][:growth][:days_to_harvest]
    @min_temp          = plant_info[:data][:main_species][:growth][:minimum_temperature][:deg_f]
    @max_temp          = plant_info[:data][:main_species][:growth][:maximum_temperature][:deg_f]
    @link_to_show_page = plant_info[:data][:main_species][:links][:self]
  end

  private

  def self.find_ph(zip)
    GrowCallService.new.ph_conversion(zip)
  end
end
