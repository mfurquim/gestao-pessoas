require "rails_helper"

RSpec.describe AcademicInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/academic_informations").to route_to("academic_informations#index")
    end

    it "routes to #new" do
      expect(:get => "/academic_informations/new").to route_to("academic_informations#new")
    end

    it "routes to #show" do
      expect(:get => "/academic_informations/1").to route_to("academic_informations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/academic_informations/1/edit").to route_to("academic_informations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/academic_informations").to route_to("academic_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/academic_informations/1").to route_to("academic_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/academic_informations/1").to route_to("academic_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/academic_informations/1").to route_to("academic_informations#destroy", :id => "1")
    end

  end
end
