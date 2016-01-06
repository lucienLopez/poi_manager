class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string :default_name
      t.string :adress
      t.decimal :latitude ,precision:10, scale:6
      t.decimal :longitude ,precision:10, scale:6
      t.decimal :rating, default:0, precision: 2, scale: 1

      t.references :city, index: true

      t.timestamps null: false
    end
    add_index :point_of_interests, :default_name, unique: true
    add_foreign_key :point_of_interests, :cities
  end
end
