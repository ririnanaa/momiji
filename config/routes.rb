Rails.application.routes.draw do

 # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
 
 namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts, only: [:show, :destroy] do
      resources :reviews, only: [:index, :destroy]
    end
    
    get 'search' => 'searches#search'
  end
  
     # 会員側のルーティング設定
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  scope module: :public do
    root to: 'homes#top'  
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :reviews, only: [:new, :index, :create], shallow: true do
        resource :favorite, only: [:create, :destroy]
      end
      resources :reviews, only: [:edit, :update, :destroy]
    end 
    
    resources :retirements, only: [:new, :destroy]
    resources :users, except: [:show, :edit, :update] do
      member do
        get :likes
      end
    end
    
    get 'search' => 'searches#search'
    get '/:name' => 'users#show' 
    get '/:name/edit' => 'users#edit'
    patch '/:name' => 'users#update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
