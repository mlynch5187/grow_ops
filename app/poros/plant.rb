class Plant

  def recommendations(zip, light)
    ph = find_ph(zip)
    TrefleService.filter(ph, light)
  end


  attr_reader :name,
              :row_spacing,
              :spread,
              :edible,
              :images,
              :light,
              :ph_range,
              :days_to_harvest

  def initialize(plant_info)
    # @name = plant_info[:]
    # @row_spacing = plant_info[:]
    # @spread = plant_info[:]
    # @edible = plant_info[:]
    # @images = plant_info[:]
    # @light = plant_info[:]
    # @ph_range = plant_info[:]
    # @days_to_harvest =plant_info[:]
  end 

  private

  def find_ph(zip)
    GrowCallService.ph_conversion(zip)
  end
end
