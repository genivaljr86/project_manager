class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = t("update_sucess")
      redirect_to @project
    else
      render :action => "edit"
    end
  end

  def destroy
  end
end
