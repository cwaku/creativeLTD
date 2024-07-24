class ChangeStatusToBookings < ActiveRecord::Migration[7.0]
  def up
    change_column :bookings, :status, :string, default: 'pending'
  end

  def down
    change_column :bookings, :status, :integer
  end
end
