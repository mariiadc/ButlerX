class RemoveServiceIdFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :service_id
  end
end
