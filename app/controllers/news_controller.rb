class NewsController < ApplicationController
  def index
    @q = News.ransack(params[:q])
    @news = @q.result(distinct: true)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to news_index_url
    else
      render 'new'
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      redirect_to news_index_url
    else
      render 'edit'
    end
  end

  def destroy
    News.find(params[:id]).destroy
    redirect_to news_index_url
  end

  def publish
    News.find(params[:id]).update(state: "发布")
    redirect_to news_index_url
  end

  def cancel
    News.find(params[:id]).update(state: "保存")
    redirect_to news_index_url
  end

  private
    def news_params
      params.require(:news).permit(
        :title, :img, :content, :video_url, :state)
    end
end