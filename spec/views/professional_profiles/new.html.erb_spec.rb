require 'rails_helper'

RSpec.describe "professional_profiles/new", type: :view do
  before(:each) do
    assign(:professional_profile, ProfessionalProfile.new())
  end

  it "renders new professional_profile form" do
    render

    assert_select "form[action=?][method=?]", professional_profiles_path, "post" do
    end
  end
end
