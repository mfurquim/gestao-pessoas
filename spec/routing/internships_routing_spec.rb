require "rails_helper"

RSpec.describe InternshipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users/1/professional_profiles/1/internships").to route_to("internships#index", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/users/1/professional_profiles/1/internships/new").to route_to("internships#new", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/professional_profiles/1/internships/1").to route_to("internships#show", :id => "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/professional_profiles/1/internships/1/edit").to route_to("internships#edit", :id => "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/professional_profiles/1/internships").to route_to("internships#create", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/professional_profiles/1/internships/1").to route_to("internships#update", :id => "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/professional_profiles/1/internships/1").to route_to("internships#update", :id => "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1/professional_profiles/1/internships/1").to route_to("internships#destroy", :id => "1", user_id: "1", professional_profile_id: "1")
    end

  end
end
