class AddPriceAfterDiscountToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price_after_discount, :integer
    add_column :products, :discount, :integer
  end
end
