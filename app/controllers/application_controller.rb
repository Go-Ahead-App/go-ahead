# frozen_string_literal: true

# Before any controller action is run, check if the controller is a Devise controller, and if so,
# permit the invite_code parameter to be passed to the sign_up action.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  inertia_share do
    {
      current_user:,
      session:,
      csrf_token: form_authenticity_token,
      flash: flash.to_hash
    }
  end

  def authenticate_admin!
    return if current_user&.is_admin?

    redirect_to root_path, alert: 'You must be an admin to do that.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:invite_code])
  end
end
