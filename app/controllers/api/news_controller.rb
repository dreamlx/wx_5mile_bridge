class Api::NewsController < Api::BaseController
  def index
    @news = News.where(state: '发布')
  end

  def show
    @news = News.find(params[:id])
  end
end