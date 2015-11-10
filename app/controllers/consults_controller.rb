class ConsultsController < ApplicationController
  def index
    @q = Consult.ransack(params[:q])
    @consults = @q.result(distinct: true)
  end

  def new
    @consult = Consult.new
  end

  def create
    @consult = Consult.new(consult_params)
    if @consult.save
      redirect_to consults_url
    else
      render 'new'
    end
  end

  def edit
    @consult = Consult.find(params[:id])
  end

  def update
    @consult = Consult.find(params[:id])
    if @consult.update(consult_params)
      redirect_to consults_url
    else
      render 'edit'
    end
  end

  def show
    @consult = Consult.find(params[:id])
  end

  def destroy
    Consult.find(params[:id]).destroy
    redirect_to consults_url
  end

  private
    def consult_params
      params.require(:consult).permit(
        :user_id, :title, :department, :content, :state)
    end
end