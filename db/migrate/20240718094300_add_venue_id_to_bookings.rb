class AddVenueIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :venue_id, :integer
    add_index :bookings, :venue_id
  end
end
