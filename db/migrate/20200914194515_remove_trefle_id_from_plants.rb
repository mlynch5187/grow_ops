class RemoveTrefleIdFromPlants < ActiveRecord::Migration[5.2]
  def change
    remove_column :plants, :trefle_id
  end
end
