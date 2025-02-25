Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top" 
  get "/homes/about" => "public/homes#about", as: "about"

  scope module: :public do
    resources :groups, only: [:new, :index, :create, :show, :edit, :show, :update, :destroy] do
      member do 
        get "permits"
      end
      resource :group_users, only: [:create, :destroy]
      resource :permits, only: [:create, :destroy]
    end
    resources :group_calendars, only: [:show, :create, :edit, :update, :destroy] do 
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
    resources :personal_calendars, only: [:index, :show, :edit, :create, :update, :destroy]
    get "search_user" => "searches#search_user"
    get "search_group" => "searches#search_group"
  end

  namespace :admin do
    resources :users, only: [:index, :show, :destroy] do 
      resource :relationships
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
    resources :groups, only: [:index, :show, :destroy] 
    resources :group_calendars, only: [:show, :destroy] do
      resources :comments, only: [:destroy]
    end

  end
end
