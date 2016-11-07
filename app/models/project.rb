class Project < ActiveRecord::Base

  validates :project_name, presence: true, uniqueness: { case_sensitive: false }
  validates :project_description, presence: true

  belongs_to :user
  has_many :activites
end
