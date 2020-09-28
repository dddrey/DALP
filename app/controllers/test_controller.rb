class TestController < ApplicationController
  def test
  end

  def finished

  end

  def question_preview
    @question = Question.find(params[:id])
    @answers = @question.answers.order(order: :desc)
  end
end
