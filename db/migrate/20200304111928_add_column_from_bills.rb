class AddColumnFromBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :service_sku, :string
  end
end
