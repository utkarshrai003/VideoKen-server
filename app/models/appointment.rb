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

  # Class Methods
  # Method to create an appointment between physician and patient
  def self.make_between(physician, patient, diseases)
    appointment = Appointment.new(physician: physician, patient: patient, diseases: diseases)
    unless Appointment.pending?(physician, patient)
      appointment.save
    else
      raise "Appointment already made"
    end
  end

  # Method to check if a duplicate pending appointment exists
  def self.pending?(physician, patient)
    Appointment.where(
      physician: physician,
      patient: patient,
      pending: true
    ).present?
  end

end
