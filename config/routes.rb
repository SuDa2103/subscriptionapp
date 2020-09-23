Rails.application.routes.draw do
  devise_for :users
  root to: 'subscriptions#index'
  resources :subscriptions
  get 'manage', to: 'pages#manage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
