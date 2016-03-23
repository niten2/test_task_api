Rails.application.routes.draw do

  root "homes#index"

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
      resources :posts, defaults: { format: :json }

      resources :profiles, defaults: { format: :json }, only: [:show]
    end
  end

end
