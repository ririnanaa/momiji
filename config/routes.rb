Rails.application.routes.draw do
  
   # 会員側のルーティング設定
  devise_for :user, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  scope module: :public do
    resources :posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  end

 # 管理者用
  devise_for :admin, skip: [:registrations], controllers: {
  sessions: "admin/sessions"
}
 
 namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
