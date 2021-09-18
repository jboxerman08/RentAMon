class MonumentsController < ApplicationController
  before_action :find_user, only: [:index, :create]

  def index
    if @url_user_id
      @monuments = Monument.where(user: @url_user_id)
    else
      @monuments = Monument.all
    end
  end

  def new
    @monument = Monument.new
  end

  def create
    @monument= Monument.new(monument_params)
    @monument.user = @url_user_id
    if @monument.save
      redirect_to user_path(@url_user_id)
    else
      render new
    end
  end

  def show
    @monument = Monument.find(params[:id])
  end

private
  def monument_params
    params.require(:monument).permit(:name, :availability, :price)
  end

  def find_user
    url_user_id = params[:id]
    @url_user_id = User.find(url_user_id) if url_user_id
  end
end
