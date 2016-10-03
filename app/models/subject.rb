class Subject < ActiveRecord::Base
  # Validations
  validates :name, format: { with: /[A-z]/, on: :create }, presence: true
  has_many :timetablings
end
