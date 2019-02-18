class CreateVehicleReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_reviews do |t|
      t.text :description
      t.integer :rating
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
