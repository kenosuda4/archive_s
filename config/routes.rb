Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/show'
    get 'genres/edit'
  end
  namespace :admin do
    resources :informations, only: [:index, :create, :show, :edit, :update]
  end

  #devise admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
