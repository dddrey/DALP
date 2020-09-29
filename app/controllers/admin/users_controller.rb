class Admin::UsersController < AdminController
  def index
    @users = User.order(id: :asc)
  end

  def test
    @user = User.find(params[:id])
    @test = @user.test
    @questions = @test.questions.order(order: :asc)
  end
end
