class Timetabling < ActiveRecord::Base
  validates :table_position, presence: true, format: {with: /\A\d{1,2}-\d{1,2}\d+\Z/}
  belongs_to :academic_information
  belongs_to :subject
end
