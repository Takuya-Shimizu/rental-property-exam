class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :rent
      t.string :address
      t.string :the_age_of_the_building
      t.text :remarks

      t.timestamps
    end
  end
end
