class Event < ApplicationRecord
    belongs_to :venue
    belongs_to :user
    has_many :bookings
    has_many :event_equipments, dependent: :destroy
    has_many :equipments, through: :event_equipments

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "date", "id", "name", "updated_at", "user_id", "venue_id"]
      end
    
      def self.ransackable_associations(auth_object = nil)
        ["bookings", "equipments", "event_equipments", "user", "venue"]
      end
  end