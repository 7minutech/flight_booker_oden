class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_join_table :passengers, :flights, table_name: :bookings
  end
end
