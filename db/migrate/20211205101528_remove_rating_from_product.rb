class RemoveRatingFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :rating, :integer
  end
end
