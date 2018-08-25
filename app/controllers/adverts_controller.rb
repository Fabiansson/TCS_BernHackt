class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy, :buy]
  before_action :logged_in_user, only: [:create, :destroy, :buy]

  # GET /adverts
  def index
    if filter_params.empty?
      @adverts = Advert.all
    else
      @adverts = Advert.filter(filter_params)
    end
  end

  # GET /adverts/1
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # POST /adverts
  def create
    @advert = Advert.new(advert_params)
      if @advert.save
        flash[:success] = 'Advert was successfully created.'
        redirect_to @advert
      else
        render :new
      end
  end

  # DELETE /adverts/1
  def destroy
    @advert.destroy
    flash[:success] = 'Advert was successfully destroyed.'
    redirect_to adverts_url
  end

  # POST /adverts/1/buy
  def buy
    if current_user.can_buy_pass?
      @user = current_user
      #Send the Email to user
      TicketMailer.with(user: @user).ticket_email.deliver_now
      flash[:success] = "Advert bought, you'll receive a mail shortly"
      redirect_to seasonpasses_path
    else
      flash[:danger] = 'You need to be a TCS member to buy tickets'
      redirect_to @seasonpass
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params[:sold_to_user_id] = current_user.id
      params.require(:advert).permit(:season_pass_id, :game_id, :sold_to_user_id)
    end

    def filter_params
      params[:date].map!{ |el| el.empty? ? nil : el } if params[:date]
      permitted_params = params.permit(:sport_id, :club_id, date: [])
      permitted_params.to_h
    end
end
