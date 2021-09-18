Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :new, :index] do
    resources :monuments, only: [:create, :show, :new, :index]
  end
end

# JOURNEY

# TO IMPLEMENT
# resources :rentals, only: [:create, :show, :new, :index, :edit, :update]
# resources :reviews, only: [:create, :new, :show]

# TO DO:
# rentals

# /users/:id/rentals show
# monuments/:id/rentals POST  rentals create
# monuments/:id/rentals/new GET rentals new
# users/:id/rentals GET rentals index
# users/:id/rentals/:id/confirm PATCH rentals update

# reviews

# monuments/:id/reviews/new POST  monuments create
# monuments/:id/reviews GET monuments show

# -----------------------------------------------

# DONE
# indexes:
# GET "/monuments"  GET monuments index ok
# users/:id/monuments GET monuments index ok

# shows:
# /monuments/:id  GET monuments show ok
# users/:id GET users show

# creates
# users/:id/monuments/new POST  monuments create ok
# users/new POST  users create ok
