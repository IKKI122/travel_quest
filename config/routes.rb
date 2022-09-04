Rails.application.routes.draw do
  namespace :admin do
    get 'reports/index'
  end
  namespace :admin do
    get 'requests/index'
    get 'requests/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'reports/index'
    get 'reports/new'
    get 'reports/edit'
  end
  namespace :public do
    get 'requests/index'
    get 'requests/new'
    get 'requests/show'
    get 'requests/edit'
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/request_likes'
    get 'users/report_likes'
    get 'users/unsubscribe'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :users, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
  end
  
  namespace :admin do
    root to: 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
