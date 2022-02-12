Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  resources :registers
  resources :conta
  root 'registers#index'
#  get '/articles', to: 'articles#index'
#  get '/articles/:id', to: 'articles#show'

  resources :articles #chamando resources o qual possui rotas construidas
end
