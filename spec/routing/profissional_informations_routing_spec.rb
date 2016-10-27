require "rails_helper"

RSpec.describe ProfissionalInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/profissional_informations").to route_to("profissional_informations#index")
    end

    it "routes to #new" do
      expect(:get => "/profissional_informations/new").to route_to("profissional_informations#new")
    end

    it "routes to #show" do
      expect(:get => "/profissional_informations/1").to route_to("profissional_informations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/profissional_informations/1/edit").to route_to("profissional_informations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/profissional_informations").to route_to("profissional_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/profissional_informations/1").to route_to("profissional_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/profissional_informations/1").to route_to("profissional_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/profissional_informations/1").to route_to("profissional_informations#destroy", :id => "1")
    end

  end
end
