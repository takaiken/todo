Rails.application.routes.draw do

  resources :tasks
  root 'homes#top'
  post 'tasks/:id' => 'tasks#edit'
  get 'taksks/:id' => 'tasks#show'
  get 'homes/guest_sign_in', to: 'homes#new_guest'
  
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	passwords: 'users/passwords'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
