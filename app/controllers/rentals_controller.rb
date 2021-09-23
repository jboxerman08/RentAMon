class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @monument = Monument.new
  end

  def create
    @rental = Rental.create rental_params
    @monument.rental.user = current_user

    @monument = Monument.find(params[:monument_id])
    @rental.monument = @monument

    autorize @rental

    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end



  private

  def rental_params
    params.require(:rental).permit(:user_id, :monument_id, :date_of_delivery, :date_of_return)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
