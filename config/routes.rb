Rails.application.routes.draw do
  devise_for :users
  # Other routes...

  resources :recipes, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create, :destroy]
    get 'random_recipe', on: :collection, as: :random_recipe
    member do
      post 'toggle_favorite'
    end
  end

  # Root route
  root 'recipes#index'

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check
end

