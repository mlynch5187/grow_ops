class AddLightToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :light, :integer
  end
end
