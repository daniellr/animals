Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end

  resources :users
  resources :posts

  get 'encontrados' => 'posts#encontrados'
  get 'perdidos' => 'posts#perdidos'
  get 'adopcion' => 'posts#adopcion'

  root 'posts#index'
end
