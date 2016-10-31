require 'rails_helper'

RSpec.describe "professional_profiles/index", type: :view do
  before(:each) do
    assign(:professional_profiles, [
      ProfessionalProfile.create!(),
      ProfessionalProfile.create!()
    ])
  end

  it "renders a list of professional_profiles" do
    render
  end
end
