require 'rails_helper'

RSpec.describe "academic_informations/show", type: :view do
  before(:each) do
    @academic_information = assign(:academic_information, AcademicInformation.create!(
      :registration => "Registration",
      :input_semester_year => "Input Semester Year",
      :current_semester_year => "Current Semester Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Registration/)
    expect(rendered).to match(/Input Semester Year/)
    expect(rendered).to match(/Current Semester Year/)
  end
end
