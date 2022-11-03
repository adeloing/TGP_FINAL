Rails.application.routes.draw do
    root 'gossips#index'
    get 'static_pages/team'
    get 'static_pages/contact'
    resources :gossips
    resources :users
    resources :cities
    resources :comments
    resources :sessions, only: [:new, :create, :destroy]
end
