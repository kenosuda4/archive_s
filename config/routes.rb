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


  namespace :user do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'athletic_events/index'
    get 'athletic_events/show'
    get 'athletic_events/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/show'
    get 'genres/edit'
  end
  namespace :admin do
    resources :informations, only: [:index, :create, :show, :edit, :update]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
