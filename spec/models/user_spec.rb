require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations ' do
    it 'belongs to roles' do
      should belong_to(:role)
    end
    it 'has only one personal information' do
      should have_one(:personal_information)
    end
    it 'have presence of role' do
      should validate_presence_of(:role)
    end
  end

  describe 'Role comparate ' do
    before(:each) do
      @user = FactoryGirl.create(:user_with_role)
    end
    it 'Have role equals' do
      expect(@user.role? :administrator).to be_truthy
    end
    it 'No have role' do
      expect(@user.role? :any).to be_falsey
    end
  end
end
