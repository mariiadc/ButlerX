class AddBillableReferenceToBills < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :billable, polymorphic: true
  end
end
