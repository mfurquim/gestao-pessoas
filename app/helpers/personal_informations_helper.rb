module PersonalInformationsHelper
  def personal_information?(user)
    not user.personal_information.nil?
  end
end
