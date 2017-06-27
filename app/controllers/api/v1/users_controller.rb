class UsersController < ApplicationController

  # Endpoint to create patient and physician users
  def create
    
  end

  private

  # Never trust the parameters from the Internet
  def user_params
    params.require(:user)
    .permit(:name, :number, :age, :email, :specialization)
  end

end
