class DropBookings < ActiveRecord::Migration[8.0]
  def change
    drop_table :bookings
  end
end
