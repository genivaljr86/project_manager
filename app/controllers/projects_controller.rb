class ProjectsController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :find_project, :only => [:show, :edit, :update, :destroy, :customer]


  def index
    @projects = Project.for(current_user).all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit

  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = t("create_sucess")
      redirect_to @project
    else
      render :action => "new"
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = t("update_sucess")
      redirect_to @project
    else
      render :action => "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = t("destroy_sucess")
    redirect_to projects_path
  end

  def customer
    @project.customer
  end


  private
  def find_project
    @project = if current_user.admin?
                 Project.find(params[:id])
               else
                 Project.readable_by(current_user).find(params[:id])
               end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t("project_not_found")
    redirect_to projects_path
  end
end
