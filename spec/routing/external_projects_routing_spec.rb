require "rails_helper"

RSpec.describe ExternalProjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/external_projects").to route_to("external_projects#index")
    end

    it "routes to #new" do
      expect(:get => "/external_projects/new").to route_to("external_projects#new")
    end

    it "routes to #show" do
      expect(:get => "/external_projects/1").to route_to("external_projects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/external_projects/1/edit").to route_to("external_projects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/external_projects").to route_to("external_projects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/external_projects/1").to route_to("external_projects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/external_projects/1").to route_to("external_projects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/external_projects/1").to route_to("external_projects#destroy", :id => "1")
    end

  end
end
