require 'rqrcode_png'
require 'digest'
module TicketMailerHelper


  def generateqr(id_abo,event_id)
    abo = id_abo.to_s
    event = event_id.to_s
    code = Digest::MD5.hexdigest abo + event

    advert = Advert.find_by(season_pass_id: id_abo, game_id: id_event)
    advert.update_all hashcode: hash

    @qr = RQRCode::QRCode.new(code).to_img.resize(200,200).to_data_url
  end
end
