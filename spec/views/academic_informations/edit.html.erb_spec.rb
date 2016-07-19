require 'rails_helper'

RSpec.describe "academic_informations/edit", type: :view do
  before(:each) do
    @academic_information = assign(:academic_information, AcademicInformation.create!(
      :registration => "MyString",
      :input_semester_year => "MyString",
      :current_semester_year => "MyString"
    ))
  end

  it "renders the edit academic_information form" do
    render

    assert_select "form[action=?][method=?]", academic_information_path(@academic_information), "post" do

      assert_select "input#academic_information_registration[name=?]", "academic_information[registration]"

      assert_select "input#academic_information_input_semester_year[name=?]", "academic_information[input_semester_year]"

      assert_select "input#academic_information_current_semester_year[name=?]", "academic_information[current_semester_year]"
    end
  end
end
