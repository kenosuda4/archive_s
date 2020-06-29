Rails.application.routes.draw do

  root 'homes#top'
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
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

  namespace :admin do
    resources :informations, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :athletic_events, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :menus, only: [:index, :show, :edit, :update, :destroy]
    resources :competitions, only: [:index, :show, :edit, :update]
  end
  #: :を忘れてエラー
  scope module: :user do
    resources :users, only: [:index, :show, :edit, :update]
    resources :menus, only: [:index, :new, :create, :show, :edit, :update]
    resources :competitions, only: [:index, :new, :create, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
