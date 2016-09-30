require 'rails_helper'

RSpec.describe "academic_informations/index", type: :view do
  before(:each) do
    assign(:academic_informations, [
      AcademicInformation.create!(
        :registration => "Registration",
        :input_semester_year => "Input Semester Year",
        :current_semester_year => "Current Semester Year"
      ),
      AcademicInformation.create!(
        :registration => "Registration",
        :input_semester_year => "Input Semester Year",
        :current_semester_year => "Current Semester Year"
      )
    ])
  end

  it "renders a list of academic_informations" do
    render
    assert_select "tr>td", :text => "Registration".to_s, :count => 2
    assert_select "tr>td", :text => "Input Semester Year".to_s, :count => 2
    assert_select "tr>td", :text => "Current Semester Year".to_s, :count => 2
  end
end
