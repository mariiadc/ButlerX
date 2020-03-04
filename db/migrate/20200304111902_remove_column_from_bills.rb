class RemoveColumnFromBills < ActiveRecord::Migration[5.2]
  def change
    remove_column :bills, :booking_sku
  end
end
