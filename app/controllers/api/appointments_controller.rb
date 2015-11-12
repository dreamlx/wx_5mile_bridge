class Api::AppointmentsController < Api::BaseController
  before_action :authenticate_user!
  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      render 'show', status: 201
    else
      return api_error(status: 422)
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :cell, :booking_time)
    end
end