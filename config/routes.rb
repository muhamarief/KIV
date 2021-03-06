Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  scope '/admin' do
    resources :users
  end

  resources :roles


  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # scope '/admin' do
  #   resources :cinemas, except: [:show, :index]
  # end

  resources :cinemas, only: [:show, :index]
  resources :movies, only: [:show, :index]

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  scope '/admin', as: 'admin' do
    resources :cinemas, except: [:show, :index]
    resources :movies, except: [:show, :index]
    resources :showplaces do
      resources :screenings
    end
  end

  resources :search, only: :get

  get "search" => "search#index"

  get "/coming_soon" => "movies#coming_soon", as: "coming_soon"
  get "/showing_now" => "movies#showing_now", as: "showing_now"

  get "/screenings/:screening_id/seats" => "seats#index", as: "book_seats"

  resources :screenings do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :show

  get 'bookings/:booking_id/braintree/new' => "braintree#new", as: "braintree_pay"
  post 'bookings/:booking_id/braintree/checkout' => "braintree#checkout", as: "braintree_paying"
end
