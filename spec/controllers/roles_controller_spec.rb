require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index ' do
    it 'assigns the users role as @roles_user ' do
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      get :index, {}
      expect(assigns(:roles_users)).to include('all')
    end
  end

  describe 'GET #edit ' do
    it 'assigns the user to change role' do
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      get :edit, user_id: user.to_param
      expect(assigns(:user)).to eq(user)
    end
    it 'assigns the roles to change role' do
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      FactoryGirl.create(:assessor)
      get :edit, user_id: user.to_param
      expect(assigns(:roles)).to eq([['Assessores', 2]])
    end
  end
  describe 'PUT #update ' do
    before(:each) do
      @user = FactoryGirl.create(:user_full)
      sign_in @user
    end
    it 'redirects to the index roles' do
      post :update, user_id: @user.to_param,
                    role: @user.role.to_param
      expect(response).to redirect_to(action: :index)
    end
    it 'redirect to edit' do
      post :update, user_id: @user.to_param,
                    role: Role.last.id + 1
      expect(response).to render_template(:edit)
    end
  end
end
