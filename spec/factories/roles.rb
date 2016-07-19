FactoryGirl.define do
  factory :role do
    name 'administrator'
    description 'The boss owner of the application'
  end
  factory :assessor, class: Role do
    name 'assessor'
    description 'The boss owner of the application'
  end
end
