class ProfessionalProfile < ProfessionalInformation
  attr_accessor :informations
  after_initialize :initialize_list
  
  # Return the list of informations for the professional profile from a user
  def professional_informations
    initialize_list
    self.informations
  end
  # Add a professional information to this professional profile
  def add_information(professional_information = nil)
    initialize_list
    unless professional_information.nil?
      professional_information.update(professional_profile_id: self.id)
      self.informations << professional_information
    end
  end
  # Remove some information from this professional profile
  def remove_information(professional_information = nil)
    initialize_list
    unless self.informations.delete(professional_information).nil?
      professional_information.destroy!
    end
  end
  def initialize_list
    if self.informations.nil? && !self.id.nil?
      self.informations = []
      self.informations+= ExtraSkill.where(professional_profile_id: self.id)
      self.informations+= Internship.where(professional_profile_id: self.id)
      self.informations+= ExternalProject.where(professional_profile_id: self.id)
    end
  end

  def to_s
    puts "Professional profile: "
    self.informations.each do |professional_information|
        print professional_information
        puts ""
    end
  end
end
