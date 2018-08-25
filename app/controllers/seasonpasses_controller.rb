class SeasonpassesController < ApplicationController
  before_action :set_seasonpass, only: [:show, :destroy]

  # GET /seasonpasses
  def index
    @seasonpasses = current_user.seasonpasses
  end

  # GET /seasonpasses/1
  def show
  end

  # GET /seasonpasses/new
  def new
    @seasonpass = Seasonpass.new
  end

  # POST /seasonpasses
  def create
    @seasonpass = Seasonpass.new(seasonpass_params)
    if @seasonpass.save
      flash[:success] ='Seasonpass was successfully created.'
      redirect_to @seasonpass
    else
      flash[:danger] = @seasonpass.errors.full_messages
      render :new
    end
  end

  # DELETE /seasonpasses/1
  def destroy
    @seasonpass.destroy
    flash[:success] ='Seasonpass was successfully deleted.'
    redirect_to seasonpasses_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasonpass
      @seasonpass = current_user.seasonpasses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seasonpass_params
      params[:seasonpass][:user_id] = current_user.id
      params.require(:seasonpass).permit(:user_id, :club_id)
    end
end
