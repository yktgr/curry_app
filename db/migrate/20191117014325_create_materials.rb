class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.string :amount, null: false
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
