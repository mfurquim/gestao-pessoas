require 'rails_helper'

RSpec.describe "academic_informations/show", type: :view do
  before(:each) do
    @academic_information = assign(:academic_information, AcademicInformation.create!(
      :registration => "Registration",
      :admission_year => "Admission Year",
      :current_semester => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Registration/)
    expect(rendered).to match(/Admission Year/)
    expect(rendered).to match(/2/)
  end
end
