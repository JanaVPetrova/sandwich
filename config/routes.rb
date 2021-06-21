Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  namespace :profile do
    resources :home, only: :index
    resources :recipes do
      scope module: :recipes do
        resources :ingredient_groups, only: %i[index new create edit update] do
          scope module: :ingredient_groups do
            resources :recipe_ingredients, only: %i[new index create update] do
              get :batch_edit, on: :collection
            end
          end
        end
      end
    end

    root to: 'home#index'
  end

  resources :recipes
  resources :rooms do
    resources :messages
  end

  root to: 'recipes#index'
end
