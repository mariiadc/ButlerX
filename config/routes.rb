Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'index', to: 'pages#index', as: :index
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
    resources :bookings, only: [:index, :show, :new, :create] do
      resources :services, only: [:index, :show]
      resources :events, only: [:index, :show]
      resources :meals, only: [:index, :show]
      resources :rooms, only: [ :show]
      resources :bills, only: [:show, :create] do
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
