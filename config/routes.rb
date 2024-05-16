Rails.application.routes.draw do

 # 管理者用
  devise_for :admin, skip: [:registrations], controllers: {
  sessions: "admin/sessions"
}
 
 namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts, only: [:show, :destroy]
    get 'search' => 'searches#search'
  end
  
     # 会員側のルーティング設定
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  scope module: :public do
    root to: 'homes#top'  
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :retirements, only: [:new, :destroy]
    
    get 'search' => 'searches#search'
    get '/:name' => 'users#show'
    get '/:name/edit' => 'users#edit'
    patch '/:name' => 'users#update'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
