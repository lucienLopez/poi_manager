class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :text

      t.references :language, index: true
      t.references :point_of_interest, index: true

      t.timestamps null: false
    end
    add_index :translations, [:language_id, :point_of_interest_id], :unique=> true
    add_foreign_key :translations, :languages
    add_foreign_key :translations, :point_of_interests
  end
end
