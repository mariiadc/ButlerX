class AddSeveralDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer
      # only guest specific columns
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
      # only hotel specific columns
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :stars, :integer
  end
end
