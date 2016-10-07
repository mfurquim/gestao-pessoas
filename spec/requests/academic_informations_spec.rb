require 'rails_helper'

RSpec.describe "AcademicInformations", type: :request do
  describe "GET /academic_informations" do
    it "works! (now write some real specs)" do
      get academic_informations_path
      expect(response).to have_http_status(200)
    end
  end
end
