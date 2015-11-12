class Api::AdvicesController < Api::BaseController
  def index
    @advices = Advice.where(state: '发布', advice_type: params[:advice_type])
  end

  def show
    @advice = Advice.find(params[:id])
  end
end