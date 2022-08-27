Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'
  get '/cities/:id/parks', to: 'city_parks#index'
end
