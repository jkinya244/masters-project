class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :cuisine
      t.string :meal_type
      t.text :cooking_instructions

      t.timestamps
    end
  end
end
