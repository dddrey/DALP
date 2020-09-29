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

    @test = current_user.test
    if @test.nil?
      @test = UserTest.create(user_id: current_user.id)
      @test.generate
      @test.update(start_at: Time.now, end_at: Time.now + 1.hour)
    elsif @test.finished?
      redirect_to test_finished_path
    end
  end

  def finished

  end

  def question_preview
    @question = Question.find(params[:id])
    @answers = @question.answers.order(order: :desc)
  end
end
