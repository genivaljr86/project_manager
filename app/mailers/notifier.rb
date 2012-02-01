class Notifier < ActionMailer::Base
  default from: "ernane.sena@gmail.com"

  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :from => "Ticketee",
         :subject => "[ticketee] #{comment.task.project.title} - #{comment.task.title}")
  end
end
