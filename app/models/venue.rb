class Venue < ApplicationRecord
    has_many :events

    def self.ransackable_attributes(auth_object = nil)
        ["capacity", "created_at", "id", "location", "name", "updated_at"]
      end
  end