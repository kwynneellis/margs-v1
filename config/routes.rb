Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "properties#show", id: 1
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "recommendations", to: "pages#recommendations"

  resources :properties, only: [:index, :show, :edit, :update] do
    resources :enquiries, only: [:new, :create, :index, :show, :destroy]
  end
end
