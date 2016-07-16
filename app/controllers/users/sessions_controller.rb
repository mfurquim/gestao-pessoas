# Inheritance from devise
class Users::SessionsController < Devise::SessionsController
  # POST /resource/create
  def create
    super do |resource|
      flash[:success] =  I18n.t('devise.sessions.signed_in')
      if resource.personal_information.nil?
        redirect_to(new_user_personal_information_url(resource),
                    notice: 'Insira seus dados pessoais!') && return
      end
    end
  end
end
