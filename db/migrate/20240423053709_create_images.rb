class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :url
      t.string :alt_text

      t.timestamps
    end
  end
end
