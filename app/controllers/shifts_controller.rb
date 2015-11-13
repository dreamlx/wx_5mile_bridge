class ShiftsController < ApplicationController
  def index
    @q = Shift.ransack(params[:q])
    @shifts = @q.result(distinct: true)
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to shifts_url
    else
      render 'new'
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to shifts_url
    else
      render 'edit'
    end
  end

  def destroy
    Shift.find(params[:id]).destroy
    redirect_to shifts_url
  end

  private
    def shift_params
      params.require(:shift).permit(:doctor_id, :date, :from_time, :to_time, :category, :shift_type)
    end
end