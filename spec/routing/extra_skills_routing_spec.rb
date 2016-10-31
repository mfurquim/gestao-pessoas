require "rails_helper"

RSpec.describe ExtraSkillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/extra_skills").to route_to("extra_skills#index")
    end

    it "routes to #new" do
      expect(:get => "/extra_skills/new").to route_to("extra_skills#new")
    end

    it "routes to #show" do
      expect(:get => "/extra_skills/1").to route_to("extra_skills#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/extra_skills/1/edit").to route_to("extra_skills#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/extra_skills").to route_to("extra_skills#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/extra_skills/1").to route_to("extra_skills#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/extra_skills/1").to route_to("extra_skills#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/extra_skills/1").to route_to("extra_skills#destroy", :id => "1")
    end

  end
end
