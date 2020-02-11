Rails.application.routes.draw do
  root to: "application#index"
  resources :repositories, only: [:index], defaults: { format: :json }
end
