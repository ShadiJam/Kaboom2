class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :trip_name

      t.timestamps
    end
  end
end
