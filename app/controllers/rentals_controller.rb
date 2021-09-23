class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental - Rental.find(params[:id])
  end

  def create
    @rental = Rental.new(rental_params)
    @monument = Monument.find(params[:monument_id])
    @rental.user = current_user
    @rental.monument = @monument

     authorize @rental
     authorize @monument

    if @rental.save
      redirect_to monument_path(@monument), notice: 'Your booking request has been received'
    else
      render :new
    end
  end

  def new
    @rental = Rental.new
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :monument_id, :date_of_delivery, :date_of_return)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
