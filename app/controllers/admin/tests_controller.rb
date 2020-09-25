class Admin::TestsController < AdminController
  def index
    @tests = Test.order(id: :desc)
  end

  def show
  end
end
