class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.integer :length_cm
      t.integer :width_cm
      t.string :zip_code
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
