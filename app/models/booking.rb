class Booking < ApplicationRecord
    belongs_to :event
    belongs_to :user
    belongs_to :venue
    has_and_belongs_to_many :equipments, join_table: 'bookings_equipments'
    # enum status: { pending: 0, confirmed: 1 }
  
    validates :event_id, :user_id, :venue_id, :date, presence: true
    validate :equipment_availability

    after_initialize :set_default_status, if: :new_record?
  
    private

    def set_default_status
        self.status ||= 'pending'
    end
  
    def equipment_availability
      equipments.each do |equipment|
        errors.add(:equipments, "#{equipment.name} is not available") unless equipment.availability
      end
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "event_id", "id", "status", "updated_at", "user_id", "venue_id"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["equipments", "event", "user", "venue"]
    end
  end