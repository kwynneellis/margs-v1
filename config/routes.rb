Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "properties#show", id: 1

  resources :properties, only: [:index, :show, :edit, :update] do
    get "/get-in-touch-2317", to: 'enquiries#new', as: :new_enquiry
    resources :enquiries, only: [:create, :index, :show, :destroy]
    resources :recommendations, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :bookings, only: [:new, :create, :index, :edit, :update, :destroy]
  end
end
