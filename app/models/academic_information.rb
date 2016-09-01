class AcademicInformation < ActiveRecord::Base
	validates :registration :admission_year :current_semester, presence: true
end
