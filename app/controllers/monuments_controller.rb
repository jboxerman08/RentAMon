class MonumentsController < ApplicationController
  def index
    @monuments = policy_scope(Monument)
    @monuments = Monument.where.not(latitude: nil, longitude: nil)
    @markers = @monuments.map do |monument|
      {lat: monument.latitude, lng: monument.longitude}
    end
  end

  def new
    @monument = Monument.new
    authorize @monument
    @markers = {latitude: @monument.latitude, longitude: @monument.longitude}
  end

  def create
    @monument = Monument.new(monument_params)
    @monument.user = current_user

    authorize @monument

    if @monument.save
      redirect_to @monument, notice: 'The monument was successfully created'
    else
      render :new
    end
  end

  def show
    @monument = Monument.find(params[:id])
    authorize @monument
  end

  private

  def monument_params
    params.require(:monument).permit(:name, :availability, :price, :description, :longitude, :latitude, photos: [])
  end
end
