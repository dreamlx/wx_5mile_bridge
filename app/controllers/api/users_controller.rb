class Api::UsersController < Api::BaseController
  before_action :authenticate_user!, only: [:show]
  def create
    return api_error(status: 422) if params[:user].nil?

    @user = User.new(user_params)
    if @user.save
      render 'show', status: 201
    else
      return api_error(status: 422)
    end
  end

  def show
    @user = current_user
  end

  def doctors
    @doctors = Doctor.all.map {|doctor| [doctor.id, doctor.name]}
    render json: {doctors: @doctors}
  end

  private
    def user_params
      params.require(:user).permit(
        :cell, :name, :address, :gender, :id_no, :card_no, 
        :doctor_id, :password, :password_confirmation)
    end
end
