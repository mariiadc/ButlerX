class RemoveServiceskuFromBills < ActiveRecord::Migration[5.2]
  def change
    remove_column :bills, :service_sku
  end
end
