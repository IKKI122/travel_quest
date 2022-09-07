Rails.application.routes.draw do
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    get '/users/:id/request_likes'=>'users#request_likes', as:'request_likes'
    get '/users/:id/report_likes'=>'users#report_likes', as:'report_likes'
    get '/users/unsubscribe/:id'=>'users#unsubscribe', as:'unsubscribe'
    patch '/users/withdraw'=>'users#withdraw', as:'withdraw'
    resources :relationships, only: [:create, :destroy]
    get '/relationships/followings'=>'relationships#followings', as:'followings'
    get '/relationships/followers'=>'relationships#followers', as:'followers'
    resources :requests
    resources :request_likes, only: [:create, :destroy]
    resources :request_comments, only: [:create, :destroy]
    resources :reports, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :report_likes, only: [:create, :destroy]
    resources :report_comments, only: [:create, :destroy]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :update]
    resources :requests, only: [:index, :show, :destroy]
    resources :request_comments, only: [:destroy]
    resources :reports, only: [:index, :destroy]
    resources :report_comments, only: [:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
