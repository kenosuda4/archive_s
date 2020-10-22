Rails.application.routes.draw do


  root 'homes#top'
  get 'homes/invalid' => 'homes#invalid'
  get 'homes/about' => 'homes#about'

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
   # テストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # post '/homes/guest_sign_in', to: 'homes#new_guest'

  # 検索
  get '/search' => 'searchs#search', as: 'search' 
  # ソート機能
  get '/sorts' => 'sorts#sort', as: 'sort'

  namespace :admin do
    resources :informations, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :athletic_events, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :menus, only: [:index, :show, :edit, :update, :destroy]
    resources :competitions, only: [:index, :show, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :records, only: [:show, :edit, :update, :destroy]
    resources :raps, only: [:create, :show, :edit, :update, :destroy]

  end
  #: :を忘れてエラー
  scope module: :user do
    resources :users, only: [:index, :show, :edit, :update] do
      delete :quit, on: :member
    end
    # menu+bookmark
    resources :menus do
      post 'add' => 'bookmarks#create'
      delete '/add' => 'bookmarks#destroy'
    end
    resources :bookmarks, only: [:index]
    resources :competitions
    resources :records, only: [:create, :show, :edit, :update, :destroy]
    resources :raps, only: [:create, :show, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
