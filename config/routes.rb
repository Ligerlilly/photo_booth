Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :galleries do
  	resources :photos
  end
end
