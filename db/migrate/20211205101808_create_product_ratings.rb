class CreateProductRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :product_ratings do |t|
      t.integer :start
      t.text :comment
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
    end
  end
end
