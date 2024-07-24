class CreateJoinTableBookingsEquipments < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bookings, :equipments do |t|
      t.index [:booking_id, :equipment_id]
      t.index [:equipment_id, :booking_id]
    end
  end
end
