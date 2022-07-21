Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :organisations, only: [:create, :edit, :update] do
    get :join_organisation, to: "users#join_organisation", as: :join
    get :leave_organisation, to: "users#leave_organisation", as: :leave
    resources :shifts, only: [:create], as: :shifts
  end

  resources :shifts, only: [:index, :edit, :update, :destroy], as: :shifts

  get :prior_shifts, to: "shifts#view_prior", as: :view_prior

  get 'prior_shifts/:id/add_prior_shift', to: "shifts#add_prior_shift", as: :add_prior

  get :my_profile, to: "users#my_profile"
end
