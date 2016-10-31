require 'rails_helper'

RSpec.describe "ExtraSkills", type: :request do
  describe "GET /extra_skills" do
    it "works! (now write some real specs)" do
      get extra_skills_path
      expect(response).to have_http_status(200)
    end
  end
end
