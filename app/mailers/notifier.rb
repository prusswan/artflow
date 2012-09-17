class Notifier < ActionMailer::Base
  default from: 'Art Flow <artflow@artflowme.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.creation_added.subject
  #
  def creation_added(creation)
    @creation = creation
    @campaign = creation.project.campaign
    mail to: "test@artflowme.com",
         subject: "Creation Added"
  end

  def marketing_email(use_tables=false)
    mail_options = {
      to: "test@artflowme.com",
      subject: "Marketing Email"
    }
    mail_options.merge!(template_name: 'marketing_email_tables') if use_tables

    mail mail_options
  end
end
