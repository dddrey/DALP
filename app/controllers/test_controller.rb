class TestController < ApplicationController
  def test
    if params[:t].present?
      user = User.find_by(test_token: params[:t])
      redirect_to root_path if user.nil?

      # sign_in(user)
      session[:user_id] = user.id
      redirect_to test_path
    end

    redirect_to root_path if current_user.nil?
  end

  def finished

  end

  def question_preview
    @question = Question.find(params[:id])
    @answers = @question.answers.order(order: :desc)
  end
end
