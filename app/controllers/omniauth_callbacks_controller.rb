class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line; basic_action end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @profile = SocialProfile.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @profile
        @profile.set_values(@omniauth)
        sign_in(:user, @profile.user)
      else
        @profile = SocialProfile.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        email = "example@gmail.com"
        @profile.user = current_user || User.create!(email: email, password: Devise.friendly_token[0, 20])
        @profile.set_values(@omniauth)
        sign_in(:user, @profile.user)
        redirect_to edit_user_path(@profile.user.id) and return
      end
    end
    redirect_to new_user_session_path
  end

end
