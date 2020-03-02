class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.string :booking_number, null: false
      t.references :user, foreign_key: true
    end
  end
end
