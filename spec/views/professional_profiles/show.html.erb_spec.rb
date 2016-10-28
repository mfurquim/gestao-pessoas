require 'rails_helper'

RSpec.describe "professional_profiles/show", type: :view do
  before(:each) do
    @professional_profile = assign(:professional_profile, ProfessionalProfile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
