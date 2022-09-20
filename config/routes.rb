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
      resource :favorites, only: [:create, :index, :show, :destroy]
      member do
        get :photo_images
      end
      collection do
        get 'search'
      end

    end

    post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
    delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

    resources :albums, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :album_favorites, only: [:create, :index, :show, :destroy]
      member do
        get :album
      end
    end
    post 'album_favorite/:id' => 'album_favorites#create', as: 'create_album_favorite'
    delete 'album_favorite/:id' => 'album_favorites#destroy', as: 'destroy_album_favorite'

    resources :album_photo_images, only: [:index, :show, :edit, :destroy, :update] do
      resource :album_photo_image_favorites, only: [:create, :index, :show, :destroy]
      member do
        get :album_photo_images
      end

      post 'album_photo_image_favorite/:id' => 'album_photo_image_favorites#create', as: 'create_album_photo_image_favorite'
      delete 'album_photo_image_favorite/:id' => 'album_photo_image_favorites#destroy', as: 'destroy_album_photo_image_favorite'
      # collection do
      #   get 'album_photo_images/download/:id' => 'album_photo_images#download'
      # end
    end

  end
end

