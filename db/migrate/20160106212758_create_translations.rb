class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :language, index: true
      t.references :point_of_interest, index: true

      t.timestamps null: false
    end
    add_foreign_key :translations, :languages
    add_foreign_key :translations, :point_of_interests
  end
end
