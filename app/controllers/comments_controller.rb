class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task

  def create
     @comment = @task.comments.build(params[:comment].merge(:user => current_user))
     if @comment.save
       flash[:notice] = "Comment has been created."
       redirect_to [@task.project, @task]
     else
       @states = State.all
       flash[:alert] = "Comment has not been created."
       redirect_to [@task.project, @task]
     end
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

end
