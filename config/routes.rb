Rails.application.routes.draw do
    root 'gossips#index'
    get 'static_pages/team'
    get 'static_pages/contact'
    get '/logout', to: 'sessions#destroy'
    resources :gossips
    resources :likes
    resources :users
    resources :cities
    resources :comments
    resources :sessions, only: [:new, :create, :destroy]
end
