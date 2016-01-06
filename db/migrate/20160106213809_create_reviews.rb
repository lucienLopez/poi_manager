class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text

      t.references :user, index: true
      t.references :point_of_interest, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :point_of_interests
  end
end
