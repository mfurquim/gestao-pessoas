require "rails_helper"

RSpec.describe ExternalProjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users/1/professional_profiles/1/external_projects").to route_to("external_projects#index", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/users/1/professional_profiles/1/external_projects/new").to route_to("external_projects#new", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/professional_profiles/1/external_projects/1").to route_to("external_projects#show", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/professional_profiles/1/external_projects/1/edit").to route_to("external_projects#edit", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/professional_profiles/1/external_projects").to route_to("external_projects#create", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/professional_profiles/1/external_projects/1").to route_to("external_projects#update", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/professional_profiles/1/external_projects/1").to route_to("external_projects#update", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1/professional_profiles/1/external_projects/1").to route_to("external_projects#destroy", id: "1", user_id: "1", professional_profile_id: "1")
    end

  end
end
