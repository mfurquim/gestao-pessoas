require "rails_helper"

RSpec.describe PersonalInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_informations").to route_to("personal_informations#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_informations/new").to route_to("personal_informations#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_informations/1").to route_to("personal_informations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_informations/1/edit").to route_to("personal_informations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_informations").to route_to("personal_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/personal_informations/1").to route_to("personal_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/personal_informations/1").to route_to("personal_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_informations/1").to route_to("personal_informations#destroy", :id => "1")
    end

  end
end
