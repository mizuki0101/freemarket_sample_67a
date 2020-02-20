Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'paycheck'
      post'pay'
    end
    resources :comments, only: :create
  end
  resources :signups, only: [:new, :create] do
    collection do
      get 'member'
      post 'address'
      post 'telephone'
      get 'login'
    end
  end
  
  resources :card, only: [:new, :show, :index] do
    collection do
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :mypage, only: [:index, :edit, :update] do
    collection do
      get 'logout', to: 'mypage#logout'
      get 'ausstellen', to: 'mypage#ausstellen'
      get 'deal', to: 'mypage#deal'
      get 'verkauf', to: 'mypage#verkauf'
      get 'profile', to: 'mypage#profile'
      get 'person', to: 'mypage#person'
      get 'addressconfirmation', to: 'mypage#addressconfirmation'
    end
  end
  resources :likes, only: [:create, :destroy, :index], defaults: { format: 'json'}
  
end
