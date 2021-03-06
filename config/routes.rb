Rails.application.routes.draw do

  #デバイス
  devise_for :users, skip: [:registrations, :sessions]
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    post '/users/sign_in', to: 'users/sessions#create'
    delete '/users/sign_out', to: 'users/sessions#destroy'
    get '/users/sign_up', to: 'users/registrations#new'
    post '/users', to: 'users/registrations#create'
  end

  #ルート設定
  root "homes#top"

  #aboutページ
  get 'about' => 'homes#about'

  #ユーザー
  resources :users do
    #フォロー
    resources :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  #投稿
  resources :posts do
    resources :comments, only: [:create, :destroy] #コメント
    resources :favorites, only: [:create, :destroy] #いいね
  end

  #コラム
  resources :columns


  #検索コーナー
  get 'post_search' => 'posts#search'
  get 'user_search' => 'users#search'
  get 'column_search' => 'columns#search'

end
