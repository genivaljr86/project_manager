ProjectManager::Application.routes.draw do
  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :customers
  end

  get 'projects/pagina/:page', to: 'projects#index'
  resources :projects, :path => "projetos" do
    resources :tasks, :path => "chamados" do
      collection do
        get :search
      end

      member do
        post :watch
      end
    end
  end

  resources :tasks do
    resources :comments
  end


  resources :customers
  resources :files


  root to: "projects#index"

  devise_for :users, :controllers => {:registrations => "registrations" }

  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  put '/admin/users/:user_id/permissions',
    :to => 'admin/permissions#update',
    :as => :update_user_permissions

end
