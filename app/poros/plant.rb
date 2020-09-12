class Plant

  def self.recommendations(zip, light)
    ph = find_ph(zip)
    TrefleService.new.filter(ph, light)
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

  def self.find_ph(zip)
    GrowCallService.new.ph_conversion(zip)
  end
end
