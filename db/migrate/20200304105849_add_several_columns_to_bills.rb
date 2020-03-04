class AddSeveralColumnsToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :booking_sku, :string
    add_reference :bills, :booking, index: true
  end
end
