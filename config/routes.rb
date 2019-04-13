Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :thx_txns, path: '/thx_txns', only: [:index, :create]
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      get '/users/me', to: 'users#me'
      mount ActionCable.server => '/cable'
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end

