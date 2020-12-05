# Preview all emails at http://localhost:3000/rails/mailers/second_stage
class SecondStagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/second_stage/email
  def email
    SecondStageMailer.email(13)
  end

  def thanks_email
    SecondStageMailer.thanks_email(454)
  end

  def first_stage_score_email
    SecondStageMailer.first_stage_score_email(454)
  end

end
