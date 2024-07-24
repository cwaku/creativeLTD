class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
