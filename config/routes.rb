Rails.application.routes.draw do

  get '/top' => 'homes#top'
  root to: 'homes#top'

  # ユーザー用
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :homes, only: [:top]
    resources :users, only: [:index, :show, :edit, :destroy, :update] do
      member do
        get :userphotos
        get :useralbums
      end
    end
    resources :photo_images, only: [:index, :show, :destroy] do
      resources :photo_comments, only: [:destroy]
    end
    resources :albums, only: [:index, :show, :destroy]

    resources :album_photo_images, only: [:index, :show, :destroy] do
      resources :album_photo_comments, only: [:destroy]
    end
  end

  scope module: :public do
    resources :users, only:[:mypage, :show, :index, :favo_photoall, :edit, :update] do
      member do
        get :photo_images
        get :favorites
        get :album_favorites
        get :album_photo_images_favorites
        get :useralbums
        get :userphotos
        get :favo_photoall
        get :favo_albumall
        get :favo_albumphotoall
      end
      collection do
        get '/mypage' => 'users#mypage', as: 'mypage'
        get 'mypage/edit' => 'users#edit', as: 'edit'
        get '/mypage' => 'users#update', as: 'update'
        get :confirm
        patch 'withdraw' => 'users#withdraw', as: 'withdraw'
      end
    end

    resources :photo_images, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :photo_comments, only: [:create, :destroy] do
        resource :goods, only: [:create, :destroy]
      end
      member do
        get :photo_images
      end
      collection do
        get 'search'
      end
    end
    resources :albums, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      collection do
        get 'search'
        get 'releases'
      end
      resource :album_favorites, only: [:create, :destroy]
      member do
        get :album
      end
    end
    resources :album_photo_images, only: [:index, :show, :edit, :destroy, :update] do
      resource :album_photo_image_favorites, only: [:create, :destroy]
      resources :album_photo_comments, only: [:create, :destroy] do
        resource :album_photo_goods, only: [:create, :destroy]
      end
      member do
        get :album_photo_images
      end
    end
    resources :notifications, only: [:index, :destroy] do
      collection do
        post 'destroy_all' => 'notifications#destroy_all'
      end
    end
  end
end
