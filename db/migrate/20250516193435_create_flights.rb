class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :start_timestamp
      t.integer :flight_duration

      t.timestamps
    end
  end
end
