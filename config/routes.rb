Rails.application.routes.draw do

   root 'application#index'

   resources :users, exclude: [:index]

   post '/login' => 'sessions#create'

   resources :ideas
   post '/ideas/:id' => 'ideas#create'
   get '/ideas/:id' => 'ideas#show'

   post '/ideas/:id/create' => 'likes#create'
   delete '/ideas/:id/destroy' => 'likes#destroy'

end
