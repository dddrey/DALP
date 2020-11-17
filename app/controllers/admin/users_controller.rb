class Admin::UsersController < AdminController
  def index
    @users = User.order(id: :desc)
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
end
