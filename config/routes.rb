Rails.application.routes.draw do

  #devise admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  } 
  
    #devise user
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  } 
  
  
  scope modul: :user do
    resources :users, only: [:index, :show, :edit, :update]
  end
  
    namespace :admin do
    resources :informations, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :athletic_events, only: [:index, :create, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
