class TicketMailer < ApplicationMailer
  default from: 'TCS_Abosharing@tcs.com'

  def ticket_email
    @user = params[:user]
    @event = params[:event]
    mail(to: @user.email, subject: "Your order for the #{@event.game} event.")
  end
end
