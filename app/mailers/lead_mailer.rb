class LeadMailer < ActionMailer::Base
  default from: "admin@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.assigned_notification.subject
  #
  def assigned_notification(user, lead)
    begin
      @user = user
      @lead = lead
      mail(from: "admin@chase360.com", to: user.email, subject: "Assigned Lead")
    rescue Exception => e
      puts "Message sending failed! #{e.backtrace}"
    end
  end

  def closed_lead_notification(user, lead, submitted_by_user)
    begin
      @user = user
      @lead = lead
      @submitted_by_user = submitted_by_user
      mail(from: "admin@chase360.com", to: submitted_by_user.email, subject: "Lead has been Closed!")
    rescue Exception => e
      puts "Message sending failed! #{e.backtrace}"
    end
  end

  def closed_lead_notification_to_manager(user, lead, manager, submitted_by_user)
    begin
      @user = user
      @lead = lead
      @manager = manager
      @submitted_by_user = submitted_by_user
      mail(from: "admin@chase360.com", to: manager.email, subject: "Lead has been Closed!")
    rescue Exception => e
      puts "Message sending failed! #{e.backtrace}"
    end
  end
end
