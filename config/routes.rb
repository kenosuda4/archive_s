Rails.application.routes.draw do

  root 'homes#top'

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
    resources :competitions, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :records, only: [:show, :edit, :update, :destroy]
  end
  #: :を忘れてエラー
  scope module: :user do
    resources :users, only: [:index, :show, :edit, :update]
    # menu+bookmark
    resources :menus do
      post 'add' => 'bookmarks#create'
      delete '/add' => 'bookmarks#destroy'
    end
    resources :bookmarks, only: [:index]
    resources :competitions
    resources :records, only: [:create, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
