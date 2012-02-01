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

  def edit

  end

  def create
    @user = User.new(params[:user])
    set_admin
    if @user.save
      flash[:notice] = t("create_sucess")
      redirect_to admin_users_path
    else
      render :action => "new"
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    set_admin
    if @user.update_attributes(params[:user])
      flash[:notice] = t("update_sucess")
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end

   def destroy
    if @user == current_user
      flash[:error] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = t("destroy_sucess")
    end

    redirect_to admin_users_path
  end



  private

  def set_admin
    @user.admin = params[:user][:admin] == "1"
  end


  def find_user
    @user = User.find(params[:id])
  end

end
