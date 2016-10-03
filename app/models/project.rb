class Project < ActiveRecord::Base

validates :project_name, presence: true, uniqueness: { case_sensitive: false }
validates :project_description, presence: true
validates :manager_name, presence: true

end
