class Activity < ActiveRecord::Base
	# All fields are necessary, except description and status.
	validates :name, presence: true
	validates :begin_date, presence: true
	validates :end_date, presence: true

    belongs_to :user
    belongs_to :project
end
