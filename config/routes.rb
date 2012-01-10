ProjectManager::Application.routes.draw do
  get "users/index"

  devise_for :users


  resources :projects do
    resources :tasks
  end

  root to: "projects#index"

end
