class AddTripidToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :trip_id, :integer
  end
end
