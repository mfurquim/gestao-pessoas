require 'rails_helper'

RSpec.describe "professional_informations/show", type: :view do
  before(:each) do
    @professional_information = assign(:professional_information, ProfessionalInformation.create!(
      :string => "",
      :string => "",
      :date => "",
      :date => "",
      :text => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
