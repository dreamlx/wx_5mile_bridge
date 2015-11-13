class ExamsController < ApplicationController
  def index
    @q = Exam.ransack(params[:q])
    @exams = @q.result(distinct: true)
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to exams_url
    else
      render 'new'
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update(exam_params)
      redirect_to exams_url
    else
      render 'edit'
    end
  end

  def destroy
    Exam.find(params[:id]).destroy
    redirect_to exams_url
  end

  private
    def exam_params
      params.require(:exam).permit(
        :user_id, :name, :id_no, :gender, :address,
        :age, :card_no, :cell, :chronic_diseases)
    end
end