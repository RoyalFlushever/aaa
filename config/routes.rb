Rails.application.routes.draw do
  resources :rooms
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'site#landing'
  get '/privacy', to: 'site#privacy', as: :privacy
  get '/tos', to: 'site#tos', as: :tos
end
