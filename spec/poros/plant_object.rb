require 'rails_helper'

RSspec.describe PlantObject do

  it "has attributes" do
    plant_info = {}

    plant = PlanObject.new(plant_info)

    expect(plant.id).to eq()
    expect(plant.name).to eq()
    expect(plant.row_spacing).to eq()
    expect(plant.spread).to eq()
    expect(plant.edible).to eq()
    expect(plant.images).to eq()
    expect(plant.light).to eq()
    expect(plant.ph_min).to eq()
    expect(plant.ph_max).to eq()
    expect(plant.days_to_harvest).to eq()
    expect(plant.min_temp).to eq()
    expect(plant.max_temp).to eq()
    expect(plant.link_to_show_page).to eq()
  end
end
