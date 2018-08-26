class TicketMailer < ApplicationMailer
  default from: 'TCS.Abosharing@gmail.com'

  def ticket_email(advert)
    attachments.inline['ticket_qr.png'] = File.read("/tmp/qrcode_#{advert.id}.png")
    @user = User.find(advert.sold_to_user_id)
    @advert = advert
    mail(to: @user.email, subject: "Your order for the event.")
  end
end
