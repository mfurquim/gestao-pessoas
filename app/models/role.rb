class Role < ActiveRecord::Base
  has_many :users

  validates :name, presence: true, format: {with:/\A[a-z]+\Z/i,on: :create}, uniqueness: true
  validates :description, length: {maximum: 300}
end
