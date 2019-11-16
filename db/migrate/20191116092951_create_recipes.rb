class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :picture
      t.text :content
      t.integer :curry_type

      t.timestamps
    end
  end
end
