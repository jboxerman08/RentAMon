class MonumentsController < ApplicationController
  before_action :find_user
  def index
    @monuments = Monument.all
  end

  def new
    @monument = Monument.new
  end

  def create
    @monument= Monument.new(monument_params)
    @monument.user = @user
    if @monument.save
      redirect_to user_path(@user)
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
    @user = User.find(params[:user_id])
  end
end
