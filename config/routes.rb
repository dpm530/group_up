Rails.application.routes.draw do


   root 'application#index'

   resources :users
   resources :events

   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'



end
