class AdminController < ActionController::Base
  layout 'admin'

  # before_action :authorize_admin!, :set_locale

  private

  def authorize_admin!
    return redirect_to root_path unless current_admin.present?
  end

  def set_locale
    I18n.locale = :en
  end
end
