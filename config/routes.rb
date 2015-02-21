Rails.application.routes.draw do
  devise_for :users, path: 'accounts', :controllers => {:registrations => "registrations"}

  root to: 'visitors#index'

  resources :galleries do
  	resources :photos
  end

  namespace :admin do
  	root to: 'base#index'
  	resources :users
  end
  resources :fees
  resources :saves
end
