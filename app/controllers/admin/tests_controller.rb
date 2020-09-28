class Admin::TestsController < AdminController
  def index
    @tests = Test.order(id: :asc)
  end

  def show
    @test = Test.find(params[:id])
  end
end
