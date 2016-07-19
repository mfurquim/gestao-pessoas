require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe "Routing to " do
    it "#profile" do
      expect(:get => "/users/1").to route_to("users#profile", :id => "1")
    end
    it "#index" do
      expect(:get => "/users").to route_to("users#index")
    end
  end
end
