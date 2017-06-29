class User < ApplicationRecord

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

  # Class Methods
  def self.patients
    patient_roles = UserRole.includes(:user).all.where(role: Role.find_by_name('patient'))
    patient_roles.map {|role| {id: role.user.id, name: role.user.name}}
  end

  def self.physicians
    physician_roles = UserRole.includes(:user).all.where(role: Role.find_by_name('physician'))
    physician_roles.map {|role| {id: role.user.id, name: role.user.name}}
  end

end
