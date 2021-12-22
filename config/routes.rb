Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'hotels#index'

  resources :contacts

  resources :prefectures 
  
  resources :hotels do
    resources :reviews
    resources :bookings
    get 'search', to: 'hotels#search'
  end

end
