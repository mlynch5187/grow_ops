class AddQuantityToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :quantity, :integer
  end
end
