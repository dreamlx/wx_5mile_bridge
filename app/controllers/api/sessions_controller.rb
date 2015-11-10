class Api::SessionsController < Api::BaseController
  def create
    return api_error(status: 422) if params[:user].blank?
    # login
    # use cell and password to login
    # find the user
    @user = User.find_by(cell: params[:user][:cell])
    # check if the password match
    if @user && @user.authenticate(params[:user][:password])
      self.current_user = @user
      render 'api/users/show'
    else
      return api_error(status: 401)
    end
  end
end