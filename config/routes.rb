Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show'
  get '/parks', to: 'parks#index'
end
