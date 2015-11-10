class Api::DoctorsController < Api::BaseController
  def index
    @doctors = Doctor.all
  end
end