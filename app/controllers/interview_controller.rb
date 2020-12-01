class InterviewController < ApplicationController
  def index
    if params[:t].present?
      user = User.find_by(interview_token: params[:t])
      return redirect_to root_path if user.nil?

      # sign_in(user)
      session[:user_id] = user.id
      return redirect_to '/interview/sign_up'
    else
      redirect_to root_path
    end
  end

  def sign_up
    return redirect_to root_path unless current_user.present?

    if current_user.interview.present?
      @interview = current_user.interview
    else
      @interviews = Interview.where(user_id: nil)
    end
  end

  def create
    return redirect_to root_path unless current_user.present?

    interview = Interview.find(params[:id])

    if interview.user_id.present?
      flash[:error] = "Выбранное время не доступно"
      return redirect_to '/interview/'
    end

    if current_user.interview.present?
      flash[:notice] = "Вы уже записаны на интервью"
      return redirect_to '/'
    end

    interview.update(user_id: current_user.id)
    flash[:notice] = 'Вы успешно зарегистрировались на интервью'
    redirect_to '/interview/sign_up'
  end
end
