ProjectManager::Application.routes.draw do

  devise_for :users

  namespace :admin do
    root :to => "base#index"
    resources :users
  end

  resources :projects do
    resources :tasks
  end

  root to: "projects#index"

end
