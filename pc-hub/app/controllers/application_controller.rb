class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params

      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:name,:email, :email_confirmation, :password,
          :password_confirmation,:nickname, :city, :state_or_province, 
          :country, :profile_link, :additional_information, :role)
      end

      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(:email, :password, :password_confirmation, :current_password, :name,
          :state_or_province, :country, :profile_link, :additional_information, :role)
      end 
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:invite).concat [:name, :nickname, :city, 
    :state_or_province, :country, :profile_link, :additional_information, :role, :approved]

    devise_parameter_sanitizer.for(:accept_invitation).concat [:name, :email, :email_confirmation, 
      :nickname, :city, :state_or_province, :country, :profile_link, :additional_information]

    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:name, :email, :email_confirmation, :nickname, :city, :state_or_province,
             :country, :profile_link, :additional_information, :invitation_token, 
             :password, :password_confirmation)
    end
  end
end