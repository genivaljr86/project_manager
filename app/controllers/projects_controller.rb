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
    if @project.save
      flash[:notice] = t("create_sucess")
      redirect_to @project
    else
      render :action => "new"
    end
  end

  def update
  end

  def destroy
  end
end
