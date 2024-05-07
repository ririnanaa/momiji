Rails.application.routes.draw do

 # 管理者用
  devise_for :admin, skip: [:registrations], controllers: {
  sessions: "admin/sessions"
}
 
 namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end
  
     # 会員側のルーティング設定
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'  
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    

    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    put 'users/information' => 'customers#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    get '/:name' => 'users#show'
    get '/:name/edit' => 'users#edit'
    patch '/:name' => 'users#update'
    
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
