class Admin::QuestionsController < AdminController
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    right_answers = question_params[:answers_attributes].keys.filter{|key| question_params[:answers_attributes][key]['right'] == '1'}
    p right_answers

    # @question.errors.add(:answers, 'Only one right answer is allowed') if right_answers.length != 1

    @question.assign_attributes(question_params)
    @question.right_answers_count = right_answers.length

    # if @question.update(question_params.merge!(right_answers_count: right_answers.length))
    if @question.save
      flash[:notice] = 'Updated'
      redirect_to edit_admin_question_path(@question)
      # render :edit
    else
      flash[:error] = 'Oops. Check errors'
      # redirect_to edit_admin_question_path(@question)
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(
      :text,
      answers_attributes: [:id, :text, :right]
    )
  end
end
