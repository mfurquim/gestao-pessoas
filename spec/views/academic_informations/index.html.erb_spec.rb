require 'rails_helper'

RSpec.describe "academic_informations/index", type: :view do
  before(:each) do
    assign(:academic_informations, [
      AcademicInformation.create!(
        :registration => "Registration",
        :admission_year => "Admission Year",
        :current_semester => 2
      ),
      AcademicInformation.create!(
        :registration => "Registration",
        :admission_year => "Admission Year",
        :current_semester => 2
      )
    ])
  end

  it "renders a list of academic_informations" do
    render
    assert_select "tr>td", :text => "Registration".to_s, :count => 2
    assert_select "tr>td", :text => "Admission Year".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
