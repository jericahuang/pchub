class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:email, :email_confirmation,
        :password,:password_confirmation,:nickname, :city, :state_or_province,
          :country, :profile_link, :additional_information, :role])

      devise_parameter_sanitizer.permit(:account_update, keys:[:email, :password,
        :password_confirmation, :current_password, :name, :city, :nickname,
          :state_or_province, :country, :profile_link, :additional_information, :role])
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:invite, keys:[:name, :nickname, :city,
    :state_or_province, :country, :profile_link, :additional_information, :role, :approved])

    devise_parameter_sanitizer.permit(:accept_invitation,keys:[:name, :email, :email_confirmation,
      :nickname, :city, :state_or_province, :country, :profile_link, :additional_information])
    
    devise_parameter_sanitizer.permit(:accept_invitation, keys:[:name, :email, :email_confirmation,
      :nickname, :city, :state_or_province,
             :country, :profile_link, :additional_information, :invitation_token,
             :password, :password_confirmation, :confirmation_token,
          :confirmed_at, :confirmation_sent_at])
  end
end