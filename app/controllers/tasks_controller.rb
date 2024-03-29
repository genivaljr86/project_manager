class TasksController < ApplicationController
  before_filter :find_project
  before_filter :find_task, :only => [:show, :edit, :update, :destroy, :watch]
  before_filter :authenticate_user!
  before_filter :authorize_create!, :only => [:new, :create]
  before_filter :authorize_update!, :only => [:edit, :update]
  before_filter :authorize_delete!, :only => [:destroy]

  def show
    @comment = @task.comments.build
  end

  def new
    @task = @project.tasks.build
    asset = @task.assets.build
  end

  def edit
  end

  def create
    @task = @project.tasks.build(params[:task].merge!(:user => current_user))
    if @task.save
      flash[:notice] = t("create_sucess")
      redirect_to [@project, @task]
    else
      render :action => "new"
    end
  end

  def update
    if @task.update_attributes(params[:task])
      flash[:notice] = t("update_sucess")
      redirect_to [@project, @task]
    else
      render :action => "edit"
    end
  end


  def destroy
    @task.destroy
    flash[:notice] = t("destroy_sucess")
    redirect_to @project
  end


  def watch
    if @task.watchers.exists?(current_user)
      @task.watchers -= [current_user]
      flash[:notice] = t("observer_task")
    else
      @task.watchers << current_user
      flash[:notice] = t("no_observer_task")
    end

    redirect_to project_task_path(@task.project, @task)
  end



  #----------------------------------Find and Restricts-------------------------------------------------#
  private

  def find_project
    @project = Project.for(current_user).find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to root_path
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def authorize_create!
    if !current_user.admin? && cannot?(:"create tasks".to_sym, @project)
      flash[:alert] = "You cannot create tickets on this project."
      redirect_to @project
    end
  end

  def authorize_update!
    if !current_user.admin? && cannot?(:"edit tasks", @project)
      flash[:alert] = "You cannot edit tickets on this project."
      redirect_to @project
    end
  end

  def authorize_delete!
    if !current_user.admin? && cannot?(:"delete tasks", @project)
      flash[:alert] = "You cannot delete tickets from this project."
      redirect_to @project
    end
  end



end
