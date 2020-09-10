class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.float :square_feet
      t.string :location
      t.timestamps
    end
  end
end
