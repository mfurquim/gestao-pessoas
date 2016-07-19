# Helper the personal informations views
module PersonalInformationsHelper
  def personal_information?(user)
    !user.personal_information.nil?
  end
end
