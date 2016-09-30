require 'rails_helper'

RSpec.describe "academic_informations/new", type: :view do
  before(:each) do
    assign(:academic_information, AcademicInformation.new(
      :registration => "MyString",
      :admission_year => "MyString",
      :current_semester => 1
    ))
  end

  it "renders new academic_information form" do
    render

    assert_select "form[action=?][method=?]", academic_informations_path, "post" do

      assert_select "input#academic_information_registration[name=?]", "academic_information[registration]"

      assert_select "input#academic_information_admission_year[name=?]", "academic_information[admission_year]"

      assert_select "input#academic_information_current_semester[name=?]", "academic_information[current_semester]"
    end
  end
end
