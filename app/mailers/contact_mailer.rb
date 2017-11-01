class ContactMailer < ApplicationMailer
	default from: "no.reply.suavis@gmail.com"

  def send_email(name, email, message)
    mails = ["contact@suavistech.com"]
    @name = name
    @email = email
    @message = message
    mail(to: mails.join(","), subject: 'New Contact Query')
  end
end
