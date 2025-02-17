Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top" 
  get "/homes/about" => "public/homes#about", as: "about"

  scope module: :public do
    resources :groups, only: [:new, :index, :create, :show, :edit, :show, :update, :destroy] do
      resource :group_users, only: [:create, :destroy]
      resources :group_calendars, only: [:show, :create, :edit, :update, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
    resources :personal_calendars, only: [:index, :show, :edit, :create, :update, :destroy]
  end

  namespace :admin do
  end
end
