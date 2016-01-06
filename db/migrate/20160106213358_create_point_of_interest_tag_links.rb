class CreatePointOfInterestTagLinks < ActiveRecord::Migration
  def change
    create_table :point_of_interest_tag_links do |t|
      t.references :tag, index: true
      t.references :point_of_interest, index: true

      t.timestamps null: false
    end
    add_foreign_key :point_of_interest_tag_links, :tags
    add_foreign_key :point_of_interest_tag_links, :point_of_interests
  end
end
