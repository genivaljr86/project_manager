class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:edit, :update, :destroy]

  def index
    @users = User.all(:order => "created_at")
  end

  def show
    @user = UserDecorator.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = t("create_sucess")
      redirect_to admin_users_path
    else
      render :action => "new"
    end
  end



  private

  def find_user
    @user = User.find(params[:id])
  end

end
