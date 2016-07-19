require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  describe 'Permition to' do
    it 'edit informations' do
      user = FactoryGirl.create(:user_with_role)
      sign_in(user)
      expect(helper.current_user).to_not be_nil
      expect(helper.see_edit? user).to be_truthy
    end
  end
end
