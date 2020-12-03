# frozen_string_literal: true

class Expert::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :require_no_authentication, only: [:create]

  # GET /resource/sign_in

  def new
    return redirect_to '/expert/dashboard' if current_expert.present?

    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    redirect_to '/expert/dashboard'
    # yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  #   yield if block_given?
  #   respond_to_on_destroy
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
