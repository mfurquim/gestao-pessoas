require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  describe 'GET #index ' do
    it 'assigns the roles as @roles ' do
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      get :index, {}
      expect(assigns(:roles)).to eql(['administrator','all'])
    end
    it 'assigns the tab role name as @actual_role ' do
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      get :index, {role: 'all'}
      expect(assigns(:actual_role)).to eql('all')
    end
    it 'assigns the wice grid table in @role_users ' do
      require 'wice_grid'
      user = FactoryGirl.create(:user_with_role)
      sign_in user
      get :index, {role: 'all'}
      expect(assigns(:role_users)).to_not be_nil
      expect(assigns(:role_users).status).to eql({
        'per_page' => 20, 'page' => 1, 'conditions' => nil, 'f' => nil
      })
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
  describe 'Private methods ' do
    it '.roles' do
      FactoryGirl.create(:role)
      FactoryGirl.create(:assessor)
      result = controller.send(:roles)
      expect(result).to be_eql([["Assessores", 2]])
    end
    context '.grid_active_record ' do
      it 'with all param' do
        result = controller.send(:grid_active_record, 'all')
        expect(result.to_sql).to eql(
          User.where("email != 'admin@zenitaerospace.com'").to_sql)
      end
      it 'with other param' do
        role = FactoryGirl.create(:role)
        result = controller.send(:grid_active_record, role.name)
        expect(result.to_sql).to eql(
          User.where("email != 'admin@zenitaerospace.com' "+
                     "and role_id = ?", role.id).to_sql
        )
      end
      it 'raise exception' do
        expect { 
          controller.send(:grid_active_record, 'a') 
        }.to raise_error(ActiveRecord::RecordNotFound,
                         "Role don't found with name a")
      end
    end
  end
end
