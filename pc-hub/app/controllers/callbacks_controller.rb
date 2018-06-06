class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    #update user info upon each login
      auth = request.env['omniauth.auth']
      @user.update_attribute(:name, auth.info.name)
      @user.update_attribute(:email, auth.info.email)
      @user.update_attribute(:github, auth.info.nickname)
      @user.update_attribute(:city, auth.extra.raw_info.location)
      @user.update_attribute(:profile_link, auth.extra.raw_info.html_url)
      @user.update_attribute(:gitAvatar, auth.info.image)
      @user.update_attribute(:additional_information, auth.extra.raw_info.bio)

    sign_in_and_redirect @user
  end
end
