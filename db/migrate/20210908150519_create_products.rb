class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :view_count
      t.integer :quantity
      t.integer :rating
      t.belongs_to :category

      t.timestamps
    end
  end
end
