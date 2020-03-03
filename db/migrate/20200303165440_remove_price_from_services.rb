class RemovePriceFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :price
  end
end
