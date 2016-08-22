Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'pages#index'
get 'events', to: 'pages#events'

resources :events

end
