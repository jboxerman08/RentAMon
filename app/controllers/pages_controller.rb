class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def about
  end

  def dashboard
    @my_monuments = Monument.where(user: current_user)
    @monuments_i_rent = Monument.joins(:rentals).where(rentals: { user_id: current_user.id })
    @my_rentals = Rental.where(user: current_user)
    @rental_requests_received = Rental.joins(:monument).where(monuments: { user_id: current_user.id })
  end
end
