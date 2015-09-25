class Notifier < ApplicationMailer
  default from: "hy.libsys.rails@gmail.com"
  def book_available(member)
    @member = member

    mail(to: @member.email,subject: 'Book Available Notification')
  end
end
