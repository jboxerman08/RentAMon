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

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    # take the instance rental as a new one and white list it
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    # take the instance monument that can only be found with :monument_id
    # @monument = Monument.find(params[:monument_id])

    # give the authorization to rental
    authorize @rental

    # need to link monument to rental
    # @rental.monument = @monument
    # need to link user to current user


    # when it saves go back to the monument#show
    if @rental.save
      redirect_to monument_path(@rental.monument), notice: 'Your booking request has been received'
    #or redo the form
    else
      render :new
    end
  end

  def mark_as_approved
    @rental = Rental.find(params[:id])
     @rental.approve
     @rental.save
       redirect_to rentals_path
  end

  def mark_as_decline
    @rental = Rental.find(params[:id])
    @rental.decline
    @rental.save
      redirect_to rentals_path
  end

  def status?
    @rental = Rental.find_by_id(params[:id])
    if @rental.status == nil
    "Rental status is pending"
    elsif true
      "Rental approved"
    else false
      "Rental has been declined"
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
