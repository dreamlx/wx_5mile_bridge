class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_url
    else
      render 'new'
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      redirect_to doctors_url
    else
      render 'edit'
    end
  end

  def index
    @q = Doctor.ransack(params[:q])
    @doctors = @q.result(distinct: true)
  end

  def destroy
    Doctor.find(params[:id]).destroy
    redirect_to doctors_url
  end

  private
    def doctor_params
      params.require(:doctor).permit(:name, :grade, :avatar, :desc, :state,:hospital, :department)
    end
end