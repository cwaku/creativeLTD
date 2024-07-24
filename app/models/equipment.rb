class Equipment < ApplicationRecord
    has_many :event_equipments, dependent: :destroy
    has_many :events, through: :event_equipments
    has_and_belongs_to_many :bookings, join_table: 'bookings_equipments'


    def self.ransackable_attributes(auth_object = nil)
        ["availability", "cost", "created_at", "description", "id", "name", "updated_at"]
    end
  end