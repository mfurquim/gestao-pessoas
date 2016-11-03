require "rails_helper"

RSpec.describe ExtraSkillsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/1/professional_profiles/1/extra_skills").to route_to("extra_skills#index", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/users/1/professional_profiles/1/extra_skills/new").to route_to("extra_skills#new", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/professional_profiles/1/extra_skills/1").to route_to("extra_skills#show", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/professional_profiles/1/extra_skills/1/edit").to route_to("extra_skills#edit", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/professional_profiles/1/extra_skills").to route_to("extra_skills#create", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/professional_profiles/1/extra_skills/1").to route_to("extra_skills#update", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/professional_profiles/1/extra_skills/1").to route_to("extra_skills#update", id: "1", user_id: "1", professional_profile_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1/professional_profiles/1/extra_skills/1").to route_to("extra_skills#destroy", id: "1", user_id: "1", professional_profile_id: "1")
    end
  end
end
