class AddSkuToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :sku, :string
  end
end
