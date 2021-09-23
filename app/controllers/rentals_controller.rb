class RentalsController < ApplicationController
  def index
    # so the rentals made by one user show when he goes to this page see policy
    # for the scope
    @rentals = policy_scope(Rental)
  end

  def show
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @monument = Monument.find(params[:monument_id])
    @rental.user = current_user
    @rental.monument = @monument

     authorize @rental

    if @rental.save
      redirect_to monument_path(@monument), notice: 'Your booking request has been received'
    else
      render :new
    end
  end

  def new
    @rental = Rental.new
    authorize @rental
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :monument_id, :date_of_delivery, :date_of_return)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
