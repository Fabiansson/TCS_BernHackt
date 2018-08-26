require 'rqrcode_png'
require 'digest'

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
    if true #current_user.can_buy_pass?
      #Send the Email to user
      @advert.update(sold_to_user_id: current_user.id)
      generateqr(@advert.id, 11)
      TicketMailer.ticket_email(@advert).deliver
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
    params[:date].map!{ |el| (el.nil? || el.empty?) ? nil : el } if params[:date]
    permitted_params = params.permit(:sport_id, :club_id, date: [])
    permitted_params.to_h
  end

  def generateqr(id_abo,event_id)
    code = Digest::MD5.hexdigest("#{id_abo} #{event_id}")

    @advert.update(hashcode: hash)

    qrcode = RQRCode::QRCode.new(code)
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 500,
      border_modules: 4,
      module_px_size: 6,
      file: "/tmp/qrcode_#{@advert.id}.png"
      )
  end
end
