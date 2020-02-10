Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :show, :edit, :update]
  resources :signups, only: [:new, :create] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'login'
    end
  end

end
