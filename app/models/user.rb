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

  # Validations
  validates_presence_of :name, :email

  # Associations

  # Callbacks

end
