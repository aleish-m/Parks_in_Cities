Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'
  get '/cities/:id/parks', to: 'city_parks#index'
  
  post '/cities', to: 'cities#create'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'
  get '/cities/:id/parks/new', to: 'city_parks#new'
  delete '/cities/:id', to: 'cities#destroy'
  
  post '/cities/:id/parks', to: 'city_parks#create'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'
end
