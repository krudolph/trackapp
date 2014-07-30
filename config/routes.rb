Rails.application.routes.draw do

  resources :projects, only: [:index, :show, :create, :destroy]

  resources :tasks, only: [:create, :destroy] do
    member do
      get :start, :stop, :finish
    end
  end

  root to: 'projects#index'

end
