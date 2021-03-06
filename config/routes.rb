Rails.application.routes.draw do
  devise_for :users
  root to: 'monuments#index'

  get '/about', to: 'pages#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :monuments, only: [:index, :show, :create, :new]
  resources :rentals, only: [:create, :show, :new, :index, :edit, :update]

  patch '/rentals/:id/approve', to: 'rentals#mark_as_approved', as: :accept
  patch '/rentals/:id/decline', to: 'rentals#mark_as_declined', as: :decline
  get '/rentals/:id', to: 'rentals#status'
  get '/dashboard', to: 'pages#dashboard'
end




# JOURNEY

# TO IMPLEMENT
# resources :reviews, only: [:create, :new, :show]

# TO DO:
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

# rentals
# /users/:id/rentals show
# monuments/:id/rentals POST  rentals create
# monuments/:id/rentals/new GET rentals new
# users/:id/rentals GET rentals index
# users/:id/rentals/:id/confirm PATCH rentals update
