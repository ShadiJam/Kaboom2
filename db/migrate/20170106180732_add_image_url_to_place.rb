class AddImageUrlToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :image_url, :string
  end
end
