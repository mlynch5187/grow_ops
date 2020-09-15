class AddNewColumnsToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :trefle_id, :integer
    add_column :plants, :row_spacing, :integer
    add_column :plants, :spread, :integer
    add_column :plants, :edible, :boolean
    add_column :plants, :image, :string
    add_column :plants, :light, :integer
    add_column :plants, :ph_min, :float
    add_column :plants, :ph_max, :float
    add_column :plants, :days_to_harvest, :integer
    add_column :plants, :min_temp, :integer
    add_column :plants, :max_temp, :integer
    add_column :plants, :link_to_show_page, :string
  end
end
