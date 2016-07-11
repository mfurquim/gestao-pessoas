require 'rails_helper'

RSpec.describe PersonalInformationsHelper, type: :helper do
  it "User don't have personal information" do
    user = FactoryGirl.create(:user)
    expect(personal_information?(user)).to be_falsey
  end

  it 'User have personal information' do
    user = FactoryGirl.create(:user_with_personal)

    expect(personal_information?(user)).to be_truthy
  end
end
