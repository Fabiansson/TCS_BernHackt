class SeasonpassesController < ApplicationController
  before_action :set_seasonpass, only: [:show, :edit, :update, :destroy]

  # GET /seasonpasses
  def index
    @seasonpasses = Seasonpass.all
  end

  # GET /seasonpasses/1
  def show
  end

  # GET /seasonpasses/new
  def new
    @seasonpass = Seasonpass.new
  end

  # GET /seasonpasses/1/edit
  def edit
  end

  # POST /seasonpasses
  def create
    @seasonpass = Seasonpass.new(seasonpass_params)
    if @seasonpass.save
      redirect_to @seasonpass, notice: 'Seasonpass was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /seasonpasses/1
  def update
    if @seasonpass.update(seasonpass_params)
      redirect_to @seasonpass, notice: 'Seasonpass was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /seasonpasses/1
  def destroy
    @seasonpass.destroy
    redirect_to seasonpasses_url, notice: 'Seasonpass was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasonpass
      @seasonpass = Seasonpass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seasonpass_params
      params.require(:seasonpass).permit(:user_id, :club_id)
    end
end
