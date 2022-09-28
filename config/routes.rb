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
    resources :users, only: [:index, :show, :edit, :update]

  end

  # scope module: :public do
  #   resources :users
  # end
  scope module: :public do
    resources :users, only:[:mypage, :show, :index, :edit, :update] do
      member do
        get :photo_images
        get :favorites
        get :album_favorites
        get :album_photo_images_favorites
        get :useralbums
        get :userphotos
      end
      collection do
        get '/mypage' => 'users#mypage', as: 'mypage'
        get 'mypage/edit' => 'users#edit', as: 'edit'
        get '/mypage' => 'users#update', as: 'update'
        get :confirm
        patch 'withdraw' => 'users#withdraw', as: 'withdraw'
        # get 'photo_images/download/:id' => 'photo_images#download'
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
      resource :album_favorites, only: [:create, :destroy]
      member do
        get :album
      end
      collection do
        get 'search'
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
      # collection do
      #   get 'album_photo_images/download/:id' => 'album_photo_images#download'
      # end
    end

    resources :notifications, only: [:index, :destroy] do
      collection do
        post 'destroy_all' => 'notifications#destroy_all'
      end
    end
  end
end

