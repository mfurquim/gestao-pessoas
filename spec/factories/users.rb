FactoryGirl.define do
  factory :user do
    email 'email@zenitaerospace.com'
    password '123456'
    role { create(:assessor) }
  end
  factory :user_with_personal, class: User do
    email 'mail@zenitaerospace.com'
    password '123456'
    personal_information { create(:personal_information) }
    role { create(:assessor) }
  end
  factory :user_with_role, class: User do
    email 'mail@zenitaerospace.com'
    password '123456'
    role { create(:role) }
  end
  factory :user_full, class: User do
    email 'mail@zenitaerospace.com'
    password '123456'
    role { create(:role) }
    personal_information { create(:personal_information) }
  end
end
