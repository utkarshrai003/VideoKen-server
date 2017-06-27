class Api::V1::AppointmentsController < ApplicationController

  before_action :load_patient, only: [:create]
  before_action :load_physician, only: [:create]

  # Endpoint to create appointment between a patient and a physicians
  def create
    appointment = Appointment.make_between(@physician, @patient, appointment_params[:diseases])
    if appointment
      render json: { status: 200, data: AppointmentSerializer.new(user).as_json }
    else
      render json: { status: 400, error: appointment.errors.full_messages }
    end
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
    unless @patient || @patient.role.name.eql?('patient')
      render json: {status: 400 , error: "No patient found with Id: #{patient_id}"}
    }
  end

  # Method to validate Physician user
  def load_physician
    user_id = appointment_params[:physician_id]
    @physician = User.find(user_id) rescue nil
    unless @physician || @physician.role.name.eql?('physician')
      render json: {status: 400 , error: "No physician found with Id: #{physician_id}"}
    }
  end
end
