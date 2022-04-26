Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'top#index'
  get 'users/index'
  get 'users/account'
  get 'users/profile'
  get 'rooms/posts' 
  resources:rooms , only: [:new, :create, :update ,:show] do
    collection do
      get 'search'
    end
  end
  resources:users , only: [:index , :update] 
  resources:reservations , only: [:index ,:new, :create] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
