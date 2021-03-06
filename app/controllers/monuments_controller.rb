class MonumentsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name @@ :query OR address @@ :query"
      @monuments = policy_scope(Monument).where(sql_query, query: "%#{params[:query]}%")
    else
      @monuments = policy_scope(Monument)
    end

    @markers = @monuments.geocoded.map do |monument|
      {
        lat: monument.latitude,
        lng: monument.longitude,
        info_window: render_to_string(partial: "info_window", locals: { monument: monument })
      }
    end
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
      redirect_to @monument, notice: 'The monument  was successfully created'
    else
      render :new
    end
  end

  def show
    @monument = Monument.find(params[:id])
    authorize @monument

     @markers =
      [{
        lat: @monument.latitude,
        lng: @monument.longitude,
        info_window: render_to_string(partial: "info_window", locals: { monument: @monument })
      }]
  end

  private

  def monument_params
    params.require(:monument).permit(:name, :availability, :price, :description, :longitude, :latitude, photos: [])
  end
end
