Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "recommendations", to: "pages#recommendations"

  resources :properties, only: [:index, :show] do
    resources :enquiries, only: [:new, :create, :index]
  end
end
