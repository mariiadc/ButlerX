class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :state
      t.string :service_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
