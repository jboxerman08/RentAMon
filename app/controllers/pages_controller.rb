class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def dashboard
    # owner
    # The monuments the owner owns
    @my_monuments = Monument.where(user: current_user)

    # current_user.id is what links monument and rentals together
    # the monuments that are currently being rented
    @monuments_i_rent = Monument.joins(:rentals).where(rentals: { user_id: current_user.id })

    # the renters monuments that are currently rented (for the renter)
    @my_rentals = Rental.where(user: current_user).order(id: :desc)

    # requests sent to the owner from the renter
    @rental_requests_received = Rental.joins(:monument).where(monuments: { user_id: current_user.id })

    @pending_rental_requests_received = @rental_requests_received.select { |rental| rental.status.nil? }

  end
end
