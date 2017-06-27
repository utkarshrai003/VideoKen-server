class User < ApplicationRecord

  # Enumeration for specialization
  # Only for Physician Role
  enum specialization: [
    "Physician",
    "Therapist",
    "Nursing Assistant",
    "Pharmacists"
  ]

  # Associations
  has_one :user_role, {
    inverse_of: :user,
    dependent: :destroy
  }
  has_one :role, through: :user_role
  has_many :received_appointments, {
    foreign_key: :physician_id,
    class_name: 'Appointment',
    dependent: :destroy
    }
  has_many :booked_appointments, {
    foreign_key: :patient_id,
    class_name: 'Appointment',
    dependent: :destroy
  }

  # Validations
  validates_presence_of :name, :email, :role
  validates_uniqueness_of :email

end
