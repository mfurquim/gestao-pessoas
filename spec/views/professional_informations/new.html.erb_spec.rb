require 'rails_helper'

RSpec.describe "professional_informations/new", type: :view do
  before(:each) do
    assign(:professional_information, ProfessionalInformation.new(
      :string => "",
      :string => "",
      :date => "",
      :date => "",
      :text => ""
    ))
  end

  it "renders new professional_information form" do
    render

    assert_select "form[action=?][method=?]", professional_informations_path, "post" do

      assert_select "input#professional_information_string[name=?]", "professional_information[string]"

      assert_select "input#professional_information_string[name=?]", "professional_information[string]"

      assert_select "input#professional_information_date[name=?]", "professional_information[date]"

      assert_select "input#professional_information_date[name=?]", "professional_information[date]"

      assert_select "input#professional_information_text[name=?]", "professional_information[text]"
    end
  end
end
