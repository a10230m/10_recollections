Rails.application.routes.draw do

  # get 'homes/top'
  get '/top' => 'homes#top'
  root to: 'homes#top'


  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :homes, only: [:top]

  end

  # scope module: :public do
  #   resources :users
  # end
  scope module: :public do
    resources :users, only:[:show, :edit, :update] do
      member do
        get :photo_images
      end
      collection do
        get '/mypage' => 'users#show', as: 'mypage'
        get 'mypage/edit' => 'users#edit', as: 'edit'
        get '/mypage' => 'users#update', as: 'update'
        get :confirm
        patch 'withdraw' => 'users#withdraw', as: 'withdraw'

      end
    end

    resources :photo_images, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      member do
        get :photo_images
      end
    end
    resources :album_images, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      member do
        get :album_images
      end
    end
  end
end

