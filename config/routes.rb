Rails.application.routes.draw do
  resources :trips do
    resources :places
  end
  devise_for :users
  root 'trips#index'

  resources :places do
    collection { post :import}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
