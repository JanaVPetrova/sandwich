Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  namespace :profile do
    resources :home, only: :index
    resources :recipes do
      scope module: :recipes do
        resources :recipe_ingredients, only: %i[index create]
      end
    end

    root to: 'home#index'
  end

  resources :recipes

  root to: 'recipes#index'
end
