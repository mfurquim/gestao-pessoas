class AcademicInformation < ActiveRecord::Base
belongs_to :user

validates :registration, presence: true, format:
		  { with: /[0-9]{2}\/[0-9]{7}/ },
  		  uniqueness: { case_sensitive: false }

validates :input_semester_year, presence: true, format:
		  { with: /((01)|(02))\/(20)([0-9]{2})/ },
  		  uniqueness: { case_sensitive: false }

validates :current_semester_year, presence: true, format:
		  { with: /((01)|(02))\/(20)([0-9]{2})/ },
  		  uniqueness: { case_sensitive: false }

end
