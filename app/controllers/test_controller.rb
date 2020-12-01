class TestController < ApplicationController
  def test
    if params[:t].present?
      user = User.find_by(test_token: params[:t])
      redirect_to root_path if user.nil?

      # sign_in(user)
      session[:user_id] = user.id
      return redirect_to test_path
    end

    return redirect_to root_path if current_user.nil?

    @test = current_user.test
    if @test.nil?
      @test = UserTest.create(user_id: current_user.id)
      @test.generate
      @test.update(start_at: Time.now, end_at: Time.now + 1.hour)
    elsif @test.finished?
      return redirect_to test_finished_path
    end

    @question = @test.questions.where(answered: false).order(order: :asc).first
    return redirect_to test_finished_path if @question.nil?

    @answers = @question.answers.order(order: :asc)
    @data = {
      order: @question.order,
      time: @test.end_at.to_s,
      question: {
        id: @question.id,
        text: @question.text,
        answers: @answers.map{|a| { id: a.id, text: a.text }}
      }
    }
  end

  def submit_answer
    test = current_user.test
    return redirect_to test_finished_path if test.finished?

    q_id = params[:q_id].to_i
    a_id = params[:a_id].to_i
    a_text = params[:a_text]
    answered_question = UserQuestion.find(q_id)

    return redirect_to test_finished_path unless answered_question.user_test_id == test.id

    right_answer = answered_question.answers.find_by(right: true)
    answered_question.update(answered_right: a_id == right_answer.id, answered: true, user_answered_id: a_id, user_answer_text: a_text)

    next_question = test.questions.where(answered: false).order(order: :asc).first
    return render json: { finished: true } if next_question.nil?

    answers = next_question.answers.order(order: :asc)

    return render json: {
      data: {
        order: next_question.order,
        time: test.end_at.to_s,
        question: {
          id: next_question.id,
          text: next_question.text,
          answers: answers.map{|a| { id: a.id, text: a.text }}
        }
      }
    }
  end

  def finished

  end

  def question_preview
    return redirect_to root_path unless current_admin.present?

    @question = Question.find(params[:id])
    @answers = @question.answers.order(order: :desc)
  end
end
