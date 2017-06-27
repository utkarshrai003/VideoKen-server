class Api::V1::AppointmentsController < ApplicationController

  before_action :load_patient, only: [:create]
  before_action :load_physician, only: [:create]

  # Endpoint to list down all the Appointments
  def index
    appointments = Appointment.includes(:patient, :physician).all
    render json: { status: 200,
                   data: ActiveModel::ArraySerializer.new(appointments, :each_serializer =>
                   AppointmentSerializer).as_json }
  end

  # Endpoint to create appointment between a patient and a physicians
  def create
    appointment = Appointment.schedule(@physician, @patient, appointment_params[:diseases])
    response = appointment.save ? { status: 200, data: AppointmentSerializer.new(appointment).as_json } :
                                  { status: 400, error: appointment.errors.full_messages }
    render json: response
  rescue Exception => e
    render json: { status: 400, error: e.message }
  end

  private

  # Appointment strong params
  def appointment_params
    params.require(:appointment).permit(
      :patient_id,
      :physician_id,
      :diseases
    )
  end

  # Method to validate patient user
  def load_patient
    user_id = appointment_params[:patient_id]
    @patient = User.find(user_id) rescue nil
    unless @patient && @patient.role.name.eql?('patient')
      render json: {status: 400 , error: "No patient found with Id: #{user_id}"}
    end
  end

  # Method to validate Physician user
  def load_physician
    user_id = appointment_params[:physician_id]
    @physician = User.find(user_id) rescue nil
    unless @physician && @physician.role.name.eql?('physician')
      render json: {  status: 400 , error: "No physician found with Id: #{user_id}"}
    end
  end
end
