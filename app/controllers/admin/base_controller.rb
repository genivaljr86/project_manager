class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!

  def index
    @users = User.all(:order => "created_at")
  end
end
