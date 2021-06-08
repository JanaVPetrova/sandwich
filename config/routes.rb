Rails.application.routes.draw do
  resource :index, only: :show

  root to: 'index#show'
end
