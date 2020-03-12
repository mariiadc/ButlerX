Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'index', to: 'pages#index', as: :index
  get 'profile', to: 'pages#profile', as: :profile
  namespace :hotel do
    resources :services
    resources :events
    resources :meals
    resources :rooms
    resources :bookings do
      resources :chat_rooms, only: [:show] do
        resources :messages, only: [:create]
      end
    end
    resources :bills, only: [:index, :show]
  end



  namespace :guest do
    resources :cart_items, only: [:create]
    resources :bookings, only: [:index, :show, :new, :create] do
      resource :cart, only: [:show] do
        collection do
          get :pay
          get :checkout
        end
      end
      resources :cart_items, only: [:create]
      resources :services, only: [:index, :show] do
        resources :bills, only: [:index, :show, :create] do
        end
      end
      resources :events, only: [:index, :show]
      resources :meals, only: [:index, :show] do
        collection do
          get 'order_modal', to: "meals#open_modal"
        end
        resources :bills, only: [:index, :show, :create] do
        end
      end
      resources :rooms, only: [ :show] do
        get 'key', to: 'rooms#key', as: 'key'
      end
      resources :bills, only: [:index, :show, :create] do
        resources :payments, only: :new
      end
      resources :chat_rooms, only: [:show] do
        resources :messages, only: [:create]
      end
    end
  end



  require "sidekiq/web"
  authenticate :user, lambda { |u| true } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
