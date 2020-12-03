class Admin::UsersController < AdminController
  def index
    @users = if params[:second_stage].present?
      User.where(second_stage: true)
    else
      User.order(id: :desc)
    end
  end

  def test
    @user = User.find(params[:id])
    @test = @user.test
    @questions = @test.questions.order(order: :asc)
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
    interview.reset

    flash[:notice] = 'Интервью обнулено'
    redirect_to test_admin_user_path(user)
  end
end
