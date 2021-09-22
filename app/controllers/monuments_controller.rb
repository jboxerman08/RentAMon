class MonumentsController < ApplicationController
  def index
    @monuments = policy_scope(Monument)
  end

  def new
    @monument = Monument.new
    authorize @monument
  end

  def create
    @monument = Monument.new(monument_params)
    @monument.user = current_user

    authorize @monument
    if @monument.save
      redirect_to monument_path(@monument)
    else
      render new
    end
  end

  def show
    @monument = Monument.find(params[:id])
    authorize @monument
  end

  private

  def monument_params
    params.require(:monument).permit(:name, :availability, :price)
  end
end
