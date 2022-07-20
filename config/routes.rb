Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :organisations, only: [:create, :edit, :update] do
    get :join_organisation, to: "users#join_organisation", as: :join
  end

  get :leave_organisation, to: "users#leave_organisation", as: :leave

  resources :shifts, only: [:index, :create, :edit, :update, :destroy], as: :shifts

  get :my_profile, to: "users#my_profile"
end
