Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end

namespace :dashboard do
  root 'dashboard#index'
end

  resources :users

  resources :posts do
    collection do
      get 'encontrados', to: 'posts#found', as: :found
      get 'perdidos',    to: 'posts#lost', as: :lost
      get 'adopciones',  to: 'posts#adoption', as: :adoption
    end

    member do
      get 'geo'
    end
  end



  root 'posts#index'
end
