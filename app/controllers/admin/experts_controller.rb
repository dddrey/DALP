class Admin::ExpertsController < AdminController
  def index
    @experts = Expert.all
  end

  def show
    @expert = Expert.find(params[:id])
    # @interviews = @expert.interviews.order(datetime_stamp: :asc)
    @interviews = @expert.interviews
  end
end
