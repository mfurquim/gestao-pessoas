require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations " do
    it "belongs to roles" do
      should belong_to(:role)
    end
    it "has only one personal information" do
      should have_one(:personal_information)
    end
  end

  describe "Role comparate " do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @role = FactoryGirl.create(:role)
    end
    it "Have role equals" do
      @user.role=@role
      expect(@user.role? :Admin).to be true
    end
    it "No have role" do
      expect(@user.role? :any).to be false
    end
  end
end
