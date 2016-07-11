FactoryGirl.define do
  factory :personal_information do
    name 'My name'
    email 'foo_bar@mail.com'
    rg '1234567'
    birthday '01/01/1995'
    cpf '90737636149'
  end
  factory :information_without_birthday, class: PersonalInformation do
    name 'Myname'
    email 'foobar@mail.com'
    rg '1234566'
    cpf '10007032820'
  end
end
