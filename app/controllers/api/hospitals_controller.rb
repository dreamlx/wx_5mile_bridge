class Api::HospitalsController < Api::BaseController
  def current
    @hospital = Hospital.where(state: '发布').order(updated_at: :desc).first if !Hospital.where(state: '发布').empty?
    @hospital = Hospital.first if @hospital.nil?
  end
end