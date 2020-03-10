class AddSkuToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :sku, :string
  end
end
