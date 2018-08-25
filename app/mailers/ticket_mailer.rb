class TicketMailer < ApplicationMailer
  default from: 'TCS.Abosharing@gmail.com'

  def ticket_email
    @user = params[:user]
    @advert = params[:advert]
    mail(to: 'TCS.Abosharing@gmail.com', subject: "Your order for the event.")
  end
end
