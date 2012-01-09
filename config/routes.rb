ProjectManager::Application.routes.draw do
  devise_for :users


  resources :projects do
    resources :tasks
  end

  root to: "projects#index"

end
