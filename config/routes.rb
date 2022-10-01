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
    #patch '/users/withdraw'=>'users#withdraw', as:'withdraw'
    #resources :users, only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get 'request_likes'
        get 'report_likes'
        get 'unsubscribe'
        get 'followings'
        get 'followers'
        get 'user_requests'
        get 'user_reports'
      end
      collection do
        patch 'withdraw'
      end
      resource :relationships, only: [:create, :destroy]
    end
    resources :requests do
      collection do
        get 'search'
      end
      resource :request_likes, only: [:create, :destroy]
      resources :request_comments, only: [:create, :destroy]
      resources :reports, only: [:index, :new, :create, :edit, :update, :destroy] do
        resource :report_likes, only: [:create, :destroy]
        resources :report_comments, only: [:create, :destroy]
      end
    end
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :update]
    resources :requests, only: [:index, :show, :destroy] do
      resources :request_comments, only: [:destroy]
      resources :reports, only: [:index, :destroy] do
        resources :report_comments, only: [:destroy]
      end
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
