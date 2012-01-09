class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    flash[:notice] = t("create_sucess")
    redirect_to @project
  end

  def update
  end

  def destroy
  end
end
