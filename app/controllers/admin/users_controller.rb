class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:edit, :update, :destroy]

  def index
    @users = User.all(:order => "email")
  end

  def show
    @user = UserDecorator.find(params[:id])
  end


  private
  def find_user
    @user = User.find(params[:id])
  end

end
