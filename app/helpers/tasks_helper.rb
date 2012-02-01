module TasksHelper
  def toggle_watching_button
    text = if @task.watchers.include?(current_user)
             "Stop watching this ticket"
           else
             "Watch this ticket"
           end
    button_to(text, watch_project_task_path(@task.project, @task))
  end

end
