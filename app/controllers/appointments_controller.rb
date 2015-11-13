class AppointmentsController < ApplicationController
  def index
    @q = Appointment.ransack(params[:q])
    @appointments = @q.result(distinct: true)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_url
    else
      render 'new'
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to appointments_url
    else
      render 'edit'
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:user_id, :doctor_id, :booking_time, :cell, :state)
    end
end