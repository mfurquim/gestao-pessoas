# Inheritance from devise
class Users::SessionsController < Devise::SessionsController
  # POST /resource/create
  def create
    super do |resource|
      if resource.personal_information.nil?
        redirect_to(new_user_personal_information_url(resource),
                    notice: 'Insira seus dados pessoais!') && return
      end
    end
  end
end
