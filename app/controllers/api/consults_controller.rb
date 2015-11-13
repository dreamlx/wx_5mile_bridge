class Api::ConsultsController < Api::BaseController
  before_action :authenticate_user!
  def index
    @women = Consult.where(department: '妇女保健')
    @children = Consult.where(department: '儿童保健')
    @immunes = Consult.where(department: '计划免疫')
  end

  def create
    @consult = current_user.consults.build(consult_params)
    if @consult.save
      render 'show', status: 201
    else
      return api_error(status: 422)
    end
  end

  private
    def consult_params
      params.require(:consult).permit(:department, :title)
    end
end