class TasksController < ApplicationController
  before_filter :find_project
  before_filter :find_task, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = @project.tasks.build
  end

  def edit
  end

  def create
    @task = @project.tasks.build(params[:task])
    if @task.save
      flash[:notice] = t("create_sucess")
      redirect_to [@project, @task]
    else
      render :action => "new"
    end
  end

  def destroy
  end


  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end



end
