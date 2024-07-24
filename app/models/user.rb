class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :bookings
    has_many :events, through: :bookings
    enum role: { admin: 0, customer: 1, vendor: 2 }

    def self.ransackable_attributes(auth_object = nil)
        ["contact", "created_at", "email", "encrypted_password", "id", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
      end
  end