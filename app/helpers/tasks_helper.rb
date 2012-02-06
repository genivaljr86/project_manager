module TasksHelper
  def toggle_watching_button
    text = if @task.watchers.include?(current_user)
             "Parar de receber emails desse chamado"
           else
             "Receber emails desse chamado"
           end
    button_to(text, watch_project_task_path(@task.project, @task))
  end

end
