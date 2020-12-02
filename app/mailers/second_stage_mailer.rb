class SecondStageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.second_stage_mailer.email.subject
  #
  # def email
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  def email(user_id)
    @user = User.find(user_id)

    mail(   :to      => @user.email,
            :subject => "Doha Prize 2020 | Второй этап"
    ) do |format|
      format.text
      format.html
    end
  end
end
