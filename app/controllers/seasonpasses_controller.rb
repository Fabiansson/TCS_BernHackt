class SeasonpassesController < ApplicationController
  before_action :set_seasonpass, only: [:show, :edit, :update, :destroy]

  # GET /seasonpasses
  # GET /seasonpasses.json
  def index
    @seasonpasses = Seasonpass.all
  end

  # GET /seasonpasses/1
  # GET /seasonpasses/1.json
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
  # POST /seasonpasses.json
  def create
    @seasonpass = Seasonpass.new(seasonpass_params)

    respond_to do |format|
      if @seasonpass.save
        format.html { redirect_to @seasonpass, notice: 'Seasonpass was successfully created.' }
        format.json { render :show, status: :created, location: @seasonpass }
      else
        format.html { render :new }
        format.json { render json: @seasonpass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasonpasses/1
  # PATCH/PUT /seasonpasses/1.json
  def update
    respond_to do |format|
      if @seasonpass.update(seasonpass_params)
        format.html { redirect_to @seasonpass, notice: 'Seasonpass was successfully updated.' }
        format.json { render :show, status: :ok, location: @seasonpass }
      else
        format.html { render :edit }
        format.json { render json: @seasonpass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasonpasses/1
  # DELETE /seasonpasses/1.json
  def destroy
    @seasonpass.destroy
    respond_to do |format|
      format.html { redirect_to seasonpasses_url, notice: 'Seasonpass was successfully destroyed.' }
      format.json { head :no_content }
    end
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
