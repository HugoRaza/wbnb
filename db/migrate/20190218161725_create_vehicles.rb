class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :image
      t.float :price
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
