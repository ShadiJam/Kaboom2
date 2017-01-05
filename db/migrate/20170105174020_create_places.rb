class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :type
      t.string :city
      t.string :street
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
