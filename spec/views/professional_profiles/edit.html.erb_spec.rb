require 'rails_helper'

RSpec.describe "professional_profiles/edit", type: :view do
  before(:each) do
    @professional_profile = assign(:professional_profile, ProfessionalProfile.create!())
  end

  it "renders the edit professional_profile form" do
    render

    assert_select "form[action=?][method=?]", professional_profile_path(@professional_profile), "post" do
    end
  end
end
