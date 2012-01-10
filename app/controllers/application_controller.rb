class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:error] = t("authorize_admin")
      redirect_to root_path
    end
  end
end
