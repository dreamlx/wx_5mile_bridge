class Api::AdvicesController < Api::BaseController
  def index
    @advices = Advice.where(state: '发布')
  end

  def show
    @advice = Advice.find(params[:id])
  end
end