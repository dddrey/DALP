class ExpertsController < ApplicationController
  before_action :authorize_expert!

  def dashboard
    @interviews = current_expert.interviews.where.not(user_id: nil).order(datetime_stamp: :asc)
  end

  def interview_page
    @interview = Interview.find(params[:id])
    @user = @interview.user
    @questions = @user.test.questions
  end

  def submit_review
    interview = Interview.find(params[:id])
    user = interview.user
    total_score = params[:user][:total_score]
    doc = params[:user][:expert_review_doc]

    user.total_score = total_score
    user.expert_review_doc = doc if doc.present?

    user.save
    redirect_to "/expert/interviews/#{interview.id}"
  end

  private

  def authorize_expert!
    return redirect_to new_expert_session_path unless current_expert.present?
  end
end
