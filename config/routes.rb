Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/custom_sign_out' => 'devise/sessions#destroy', as: :custom_destroy_user_session
  end
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[create new destroy]
      resources :likes, only: [:create]
    end
  end
end
