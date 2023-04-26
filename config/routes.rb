Rails.application.routes.draw do
  #root_path
  root to: 'public/homes#top'

  devise_for :customers,skip: [:passwords], controllers: {
    resistrations: "public/resistrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ##admin_action
  namespace :admin do

    #admin/homes
    get '/' => 'homes#top'

    #admin/items
    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    #admin/genres
    resources :genres, only: [:index, :create, :edit, :update]

    #admin/customers
    resources :customers, only: [:index, :show, :edit, :update]

    #admin/orders
    resources :orders, only: [:show, :update]

    #admin/order_details
    resources :order_details, only: [:update]

  end

  ##public_action
  scope module: :public do

    #public/homes
    get '/about' => 'homes#about', as: 'about'

    #public/items
    resources :items, only: [:index, :show]
    get '/items/genre/:genre_id' => 'items#genre_search'
    get '/items/search' => 'items#search'

    #public/customers
    get '/customers' => 'customers#show'
    get '/customers/edit' => 'customers#edit'
    patch '/customers' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#confirmation'
    patch '/customers' => 'customers#withdrawwal'

    #public/addresses
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    #public/cart_items
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

    #public/orders
    resources :orders, only: [:new, :index, :show, :create]
    post '/orders/confirmation' => 'orders#confirmation'
    get '/orders/completion' => 'orders#completion'

  end
end
