Rails.application.routes.draw do
  $redis.set("comments", "0")
  devise_for :users
  resources :users
  get 'simple_pages/landing_page'

  resources :products do
    resources :comments
  end

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/admin'
  get 'simple_pages/index'
  get 'simple_pages/search'
  root 'simple_pages#landing_page'
  post 'simple_pages/thank_you'
  get 'simple_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

  resources :payments

  mount ActionCable.server => '/cable'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
