Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'pages#index'

resources :events

get 'signup', to: 'users#new'
resources :users, except: [:new]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

resources :categories, except: [:destroy] 
resources :venues

resources :user_registers
get 'checkin', to: 'user_registers#checkin'
resources :password_resets, only: [:new, :create, :edit, :update]
end
