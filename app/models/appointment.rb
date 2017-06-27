class Appointment < ApplicationRecord

  # Associations
  belongs_to :patient, {
    class_name: 'User',
    foreign_key: :patient_id
  }
  belongs_to :physician, {
    class_name: 'User',
    foreign_key: :physician_id
  }

  # Validations
  validates_presence_of :patient, :physician

end
