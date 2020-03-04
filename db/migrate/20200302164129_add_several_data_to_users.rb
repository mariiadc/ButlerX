class AddSeveralDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 0
      # only guest specific columns
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
      # only hotel specific columns
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :stars, :integer
  end
end
