Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  scope '/admin' do
    resources :users
  end

  resources :roles


  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :cinemas, except: [:show, :index]
  end

  resources :cinemas, only: [:show, :index]


end
