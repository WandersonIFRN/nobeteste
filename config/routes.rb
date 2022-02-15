Rails.application.routes.draw do
  devise_for :users
  resources :registers
  resources :conta
  devise_scope :user do
    authenticated do
      root 'registers#index'
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
#  get '/articles', to: 'articles#index'
#  get '/articles/:id', to: 'articles#show'

  
  resources :articles #chamando resources
end
