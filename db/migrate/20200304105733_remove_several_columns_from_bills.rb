class RemoveSeveralColumnsFromBills < ActiveRecord::Migration[5.2]
  def change
    remove_column :bills, :service_sku
    remove_column :bills, :service_id
  end
end
