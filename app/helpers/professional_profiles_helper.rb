module ProfessionalProfilesHelper
  def informations(informations = [], class_name = "")
    filtred_informations = informations.find_all do |information|
      information.class.name == class_name
    end    
    filtred_informations
  end
end
