class HospitalsController < ApplicationController
  def index
    @q = Hospital.ransack(params[:q])
    @hospitals = @q.result(distinct: true)
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to hospitals_url
    else
      render 'new'
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])

    if @hospital.update(hospital_params)
      redirect_to hospitals_url
    else
      render 'edit'
    end
  end

  def destroy
    Hospital.find(params[:id]).destroy
    redirect_to hospitals_url
  end

  def publish
    Hospital.find(params[:id]).update(state: "发布")
    redirect_to hospitals_url
  end

  private
    def hospital_params
      params.require(:hospital).permit(
        :title, :img, :content, :video_url, :state)
    end
end