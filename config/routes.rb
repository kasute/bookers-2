Rails.application.routes.draw do
  devise_for :users
  resources :photos
  resources :books
    root 'users#top'
    resources :user_images, only: [:new, :creat, :index, :show]

   get 'home/about', to: 'users#about'
  
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # resources :users,only: [show]
end
