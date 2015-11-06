class AdvicesController < ApplicationController
  def index
    @q = Advice.ransack(params[:q])
    @advices = @q.result(distinct: true)
  end

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new(advice_params)
    if @advice.save
      redirect_to advices_url
    else
      render 'new'
    end
  end

  def edit
    @advice = Advice.find(params[:id])
  end

  def update
    @advice = Advice.find(params[:id])

    if @advice.update(advice_params)
      redirect_to advices_url
    else
      render 'edit'
    end
  end

  def destroy
    Advice.find(params[:id]).destroy
    redirect_to advices_url
  end

  def publish
    Advice.find(params[:id]).update(state: "发布")
    redirect_to advices_url
  end

  def cancel
    Advice.find(params[:id]).update(state: "保存")
    redirect_to advices_url
  end

  private
    def advice_params
      params.require(:advice).permit(
        :title, :img, :content, :video_url, :advice_type, :state)
    end
end