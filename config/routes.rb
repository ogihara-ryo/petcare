Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :pets do
    resources :physicals
    resources :excretes
    resources :notes
  end
end
