class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy, :buy]

  # GET /adverts
  def index
    @adverts = Advert.all
  end

  # GET /adverts/1
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  def create
    @advert = Advert.new(advert_params)
      if @advert.save
        redirect_to @advert, notice: 'Advert was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /adverts/1
  def update
    if @advert.update(advert_params)
      redirect_to @advert, notice: 'Advert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /adverts/1
  def destroy
    @advert.destroy
    redirect_to adverts_url, notice: 'Advert was successfully destroyed.'
  end

  #POST /adverts/1/buy
  def buy
    @user = current_user
    #Send the Email to user
    TicketMailer.with(user: @user).ticket_email
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params[:sold_to_user_id] = current_user.id
      permitted_params = params.require(:advert).permit(:season_pass_id, :game_id, :sold_to_user_id)
    end

end
