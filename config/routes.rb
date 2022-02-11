Rails.application.routes.draw do
  resources :registers
  resources :conta
  root 'articles#index'

#  get '/articles', to: 'articles#index'
#  get '/articles/:id', to: 'articles#show'

  resources :articles #chamando resources o qual possui rotas construidas
end
