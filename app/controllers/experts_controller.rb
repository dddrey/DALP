class ExpertsController < ApplicationController
  def dashboard
    return redirect_to root_path unless current_expert.present?

    @interviews = current_expert.interviews.where.not(user_id: nil)
  end
end
