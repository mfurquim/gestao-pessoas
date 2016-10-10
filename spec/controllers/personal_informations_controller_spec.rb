require 'rails_helper'

RSpec.describe PersonalInformationsController, type: :controller do
  let(:valid_attributes) do
    { name: 'My name',
      email: 'foo@mail.com',
      rg: '1234567',
      cpf: '09162985582',
      birthday: '01/01/1995'}
  end

  let(:invalid_attributes) do
    { name: 'My name',
      email: 'invalid_email',
      rg: '123456',
      cpf: '12345678901',
      birthday: '15/01/1995'}
  end

  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'assigns the requested personal_information as @personal_information' do
      user = FactoryGirl.create(:user_with_personal)
      sign_in user
      get :show, user_id: user.to_param, id: user.personal_information.to_param
      expect(assigns(:information)).to eq(user.personal_information)
    end
  end
  describe 'GET #new' do
    it 'assigns a new personal_information as @personal_information' do
      user = FactoryGirl.create(:user)
      sign_in user
      print(user.personal_information)
      get :new, user_id: user.to_param
      expect(assigns(:information)).to be_a_new(PersonalInformation)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested personal_information as @personal_information' do
      user = FactoryGirl.create(:user_with_personal)
      sign_in user
      get :edit, user_id: user.to_param, id: user.personal_information.to_param
      expect(assigns(:information)).to eq(user.personal_information)
    end
  end

  describe 'POST #create ' do
    before(:each) do
      @user = FactoryGirl.create(:user_with_role)
      sign_in @user
    end
    context 'with valid params ' do
      it 'creates a new PersonalInformation' do
        expect do
          post :create, personal_information: valid_attributes,
                        user_id: @user.to_param
        end.to change(PersonalInformation, :count).by(1)
      end
      it 'assigns a newly created personal_information as @personal_information' do
        post :create, personal_information: valid_attributes,
                      user_id: @user.to_param
        expect(assigns(:information)).to be_a(PersonalInformation)
        expect(assigns(:information)).to be_persisted
      end

      it 'redirects to the created personal_information' do
        post :create, personal_information: valid_attributes,
                      user_id: @user.to_param
        expect(response).to redirect_to(
          [PersonalInformation.last.user, PersonalInformation.last])
      end
    end
    context 'with invalid params ' do
      it 'assigns a newly created but unsaved personal_information as @personal_information' do
        post :create, personal_information: invalid_attributes,
                      user_id: @user.to_param
        expect(assigns(:information)).to be_a_new(PersonalInformation)
      end

      it "re-renders the 'new' template" do
        post :create, personal_information: invalid_attributes,
                      user_id: @user.to_param
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = FactoryGirl.create(:user_full)
      sign_in @user
    end
    let(:new_attributes) do
      { name: 'My name',
        email: 'foo@mail.com',
        rg: '0001119',
        cpf: '09162985582' }
    end
    context 'with valid params' do
      it 'updates the requested personal_information' do
        put :update, id: @user.personal_information.to_param,
                     user_id: @user.to_param,
                     personal_information: new_attributes
        @user.personal_information.reload
        expect(assigns(:information)).to eql(@user.personal_information)
      end

      it 'assigns the requested personal_information as @personal_information' do
        put :update, id: @user.personal_information.to_param,
                     user_id: @user.to_param,
                     personal_information: valid_attributes
        expect(assigns(:information)).to eq(@user.personal_information)
      end

      it 'redirects to the personal_information' do
        put :update, id: @user.personal_information.to_param,
                     user_id: @user.to_param,
                     personal_information: valid_attributes
        expect(response).to redirect_to([@user, @user.personal_information])
      end
    end

    context 'with invalid params' do
      it 'assigns the personal_information as @personal_information' do
        put :update, id: @user.personal_information.to_param,
                     user_id: @user.to_param,
                     personal_information: invalid_attributes
        expect(assigns(:information)).to eq(@user.personal_information)
      end

      it "re-renders the 'edit' template" do
        put :update, id: @user.personal_information.to_param,
                     user_id: @user.to_param,
                     personal_information: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end
end
