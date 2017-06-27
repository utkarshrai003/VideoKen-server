class User < ApplicationRecord

  # Enumeration for specialization
  # Only for Physician Role
  enum specialization: [
    "Physician",
    "Therapist",
    "Nursing Assistant",
    "Pharmacists"
  ]

  # Validations
  validates_presence_of :name, :email

  # Associations

  # Callbacks

end
