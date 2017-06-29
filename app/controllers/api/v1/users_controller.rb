class Api::V1::UsersController < ApplicationController

  before_action :set_role, only: [:create]

  # Endpoint to create patient and physician users
  def create
    user = User.new(@user_info)
    if user.save && user.errors.empty?
      render json: { status: 200, data: UserSerializer.new(user).as_json }
    else
      render json: { status: 400, error: user.errors.full_messages }
    end
  end

  # Endpoint to return all the Patient users
  def patients
    patients = User.patients
    render json: { status: 200, data: patients }
  end

  # Endpoint to return all the Physician users
  def physicians
    physicians = User.physicians
    render json: { status: 200, data: physicians }
  end

  private

  # Never trust the parameters from the Internet
  def user_params
    params.permit(
      :name,
      :number,
      :age,
      :email,
      :specialization,
      :role
    )
  end

  # Method to load the role object in the User params
  def user_params_with_role(role)
    return unless role
    @user_info = user_params
    @user_info.delete(:role)
    @user_info[:role] = role
  end

  # Method to verify and set the role for the user
  def set_role
    role = Role.find_by_name(user_params[:role]) rescue nil
    role ? user_params_with_role(role) :
           (render json: { status: 400, error: "Mention a proper Role for User" })
  end

end
