class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
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


  private
  def find_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t("project_not_found")
    redirect_to projects_path
  end

end
