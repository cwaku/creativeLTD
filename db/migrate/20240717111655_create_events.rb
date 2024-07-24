class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
