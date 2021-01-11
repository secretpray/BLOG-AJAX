Rails.application.routes.draw do

  root 'posts#index'
  
  devise_for :users
  
  resources :posts do
    resources :comments, only: %i(create update destroy)
  end
  
end
