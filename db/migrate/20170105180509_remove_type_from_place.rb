class RemoveTypeFromPlace < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :type, :string
  end
end
