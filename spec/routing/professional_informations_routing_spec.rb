require "rails_helper"

RSpec.describe ProfessionalInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/professional_informations").to route_to("professional_informations#index")
    end

    it "routes to #new" do
      expect(:get => "/professional_informations/new").to route_to("professional_informations#new")
    end

    it "routes to #show" do
      expect(:get => "/professional_informations/1").to route_to("professional_informations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/professional_informations/1/edit").to route_to("professional_informations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/professional_informations").to route_to("professional_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professional_informations/1").to route_to("professional_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professional_informations/1").to route_to("professional_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professional_informations/1").to route_to("professional_informations#destroy", :id => "1")
    end

  end
end
