class AcademicInformation < ActiveRecord::Base
belongs_to :user
has_many :timetablings
has_and_belongs_to_many :subjects

validates :registration, presence: true, format:
		  { with: /[0-9]{2}\/[0-9]{7}/ },
  		  uniqueness: { case_sensitive: false }

validates :admission_year, presence: true, format:
		  { with: /((01)|(02))\/(20)([0-9]{2})/ }

validates :current_semester, presence: true, numericality:
          { only_integer: true, less_than: 17, greater_than: 0}

end
