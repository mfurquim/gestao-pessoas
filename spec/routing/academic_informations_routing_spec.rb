require "rails_helper"

RSpec.describe AcademicInformationsController, type: :routing do
  describe "routing" do
    before(:each) do
        @user = FactoryGirl.create(:user)
    end

    it "routes to #index" do
      expect(:get => "/users/1/academic_informations").to route_to("academic_informations#index",user_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/users/1/academic_informations/new").to route_to("academic_informations#new",user_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/users/1/academic_informations/1").to route_to("academic_informations#show",user_id: '1', :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/academic_informations/1/edit").to route_to("academic_informations#edit",user_id: '1', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/academic_informations").to route_to("academic_informations#create",user_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/academic_informations/1").to route_to("academic_informations#update",user_id: '1', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/academic_informations/1").to route_to("academic_informations#update",user_id: '1', :id => "1")
    end


  end
end
