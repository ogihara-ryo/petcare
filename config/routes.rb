Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :pets do
    resources :physicals
  end
end
