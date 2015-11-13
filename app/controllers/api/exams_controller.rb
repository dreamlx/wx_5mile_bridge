class Api::ExamsController < Api::BaseController
  before_action :authenticate_user!
  def create
    @exam = current_user.exams.build(exam_params)
    if @exam.save
      render 'show', status: 201
    else
      return api_error(status: 422)
    end
  end

  private
    def exam_params
      params.require(:exam).permit(:name, :id_no, :gender, :address, :age, :card_no, :cell, :chronic_diseases)
    end
end