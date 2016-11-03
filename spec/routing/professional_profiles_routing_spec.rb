require "rails_helper"

RSpec.describe ProfessionalProfilesController, type: :routing do
  describe "routing" do


    it "routes to #new" do
      expect(:get => "/users/1/professional_profiles/new").to route_to("professional_profiles#new", user_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/professional_profiles/1").to route_to("professional_profiles#show", id: "1", user_id: "1")
    end

  end
end
