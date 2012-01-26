ProjectManager::Application.routes.draw do
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :customers
  end

  resources :projects do
    resources :tasks
  end

  resources :customers

  root to: "projects#index"

  devise_for :users, :controllers => {:registrations => "registrations" }

  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  put '/admin/users/:user_id/permissions',
    :to => 'admin/permissions#update',
    :as => :update_user_permissions

end
