class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :picture
      t.text :content, null: false
      t.integer :curry_type, null: false
      t.timestamps
    end
  end
end
