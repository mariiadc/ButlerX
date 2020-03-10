class AddHotelIdToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :hotel, index: true
  end
end
