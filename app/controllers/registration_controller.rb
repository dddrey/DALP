class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.update_attributes(user_params)
      flash[:notice] = 'успех'
      redirec_to 'registration/success'
    else
      render :new
    end
  end

  def success

  end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :middle_name,
      :birth_date,
      :city,
      :education,
      :arab_study,
      :movement_help,
      :email,
      :phone,
      :social_links,
      :competition_source
    )
  end
end
