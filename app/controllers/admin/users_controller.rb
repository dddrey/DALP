class Admin::UsersController < AdminController
  def index
    @users = if params[:second_stage].present?
      # User.where(second_stage: true)
      # with_interview = User.where(second_stage: true).joins(:interview).order('interviews.datetime_stamp asc')
      # without_interview = User.where(second_stage: true).includes(:interview).where(interviews: { user_id: nil })
      # with_interview + without_interview
      ss_users = User.where(second_stage: true)
      with_middle_score = ss_users.where.not("middle_score = '' OR middle_score is NULL").order('middle_score::integer desc')
      without_middle_score = ss_users.where("middle_score = '' OR middle_score is NULL")
      with_middle_score + without_middle_score
    else
      User.order(id: :desc)
    end
  end

  def test
    @user = User.find(params[:id])
    @test = @user.test
    @interview = @user.interview
    @questions = @test.questions.order(order: :asc)
    # @questions = @test.questions.where(answered_right: false).order(order: :asc)
  end

  def destroy
    @user = User.find(params[:id])
    email = @user.email

    if @user.destroy
      flash[:notice] = "User #{email} and his test has been deleted"
      redirect_to admin_users_path
    else
      redirect_to test_admin_user_path(@user)
    end
  end

  def interview_reset
    user = User.find(params[:id])
    interview = user.interview
    interview.reset if Rails.env.production?

    flash[:notice] = 'Интервью обнулено'
    redirect_to test_admin_user_path(user)
  end
end
