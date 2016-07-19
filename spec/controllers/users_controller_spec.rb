require 'rails_helper'
require 'wice_grid'
RSpec.describe UsersController, type: :controller do
  describe 'GET #index ' do
    it 'assing the users' do
      include Wice::Controller
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user_with_role)
      sign_in user
      get :index, {}
      expect(assigns(:users)).to_not be_nil
      expect(assigns(:users).status).to eql(
        {"per_page"=>20, "page"=>1,
         "conditions"=>nil, "f"=>nil,
        "order" => "personal_informations.name",
        "order_direction" => "asc"
      })
    end
    it ' render index' do
      user = FactoryGirl.create(:user)
      sign_in user
      get :index, {}
      expect(request).to render_template(:index)
    end
  end
  describe 'Profiles ' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    context 'GET #myprofile ' do
      it 'assign user logged' do
        get :myprofile, {}
        expect(assigns(:user)).to eql(@user)
      end
      it 'render profile page' do
        get :myprofile, {}
        expect(request).to render_template(:profile)
      end
    end
    context 'GET #profile ' do
      it 'assign a user' do
        user = FactoryGirl.create(:user_with_role)
        get :profile, id: user.to_param
        expect(assigns(:user)).to eql(user)
      end
      it 'render profile' do
        get :profile, id: @user.to_param
        expect(request).to render_template(:profile)
      end
      it 'redirect to unfound record' do
        get :profile, id: User.last.id + 1
        expect(response).to have_http_status(404)
      end
    end
  end
end
