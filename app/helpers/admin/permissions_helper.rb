module Admin::PermissionsHelper
  def permissions
    {
      "view" => "Visualizar",
      "create tasks" => "Criar novas Tarefas",
      "edit tasks" => "Editar Tarefas",
      "delete tasks" => "Deletar Tarefas"
    }
  end

end
