class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:update]

protected

def update_resource(params)

    @user = User.find(current_user.id)
    is_github_account = !@user.provider.blank?

    if !is_github_account
      @user.update_with_password(params)
    else
      @user.update_without_password(params.except("current_password"))
    end

  end
end
