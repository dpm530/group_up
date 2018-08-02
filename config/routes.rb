Rails.application.routes.draw do


   root 'application#index'

   resources :users
   resources :events
   post 'events/:id/user' => 'groupups#create'
   delete 'events/:id/user' => 'groupups#destroy'

   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'



end
