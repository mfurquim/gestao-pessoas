require 'rails_helper'

RSpec.describe "academic_informations/edit", type: :view do
  before(:each) do
    @academic_information = assign(:academic_information, AcademicInformation.create!(
      :registration => "MyString",
      :admission_year => "MyString",
      :current_semester => 1
    ))
  end

  it "renders the edit academic_information form" do
    render

    assert_select "form[action=?][method=?]", academic_information_path(@academic_information), "post" do

      assert_select "input#academic_information_registration[name=?]", "academic_information[registration]"

      assert_select "input#academic_information_admission_year[name=?]", "academic_information[admission_year]"

      assert_select "input#academic_information_current_semester[name=?]", "academic_information[current_semester]"
    end
  end
end
