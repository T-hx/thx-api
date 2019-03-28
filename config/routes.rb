Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :thx_txns, path: '/thx_txns'
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end

