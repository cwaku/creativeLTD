class CreateEventEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :event_equipments do |t|
      t.references :event, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
