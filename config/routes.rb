Rails.application.routes.draw do
  root to: 'public/homes#top'

  devise_for :customers,skip: [:passwords], controllers: {
    resistrations: "public/resistrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/home/about' => 'homes#about', as: 'about'

end
