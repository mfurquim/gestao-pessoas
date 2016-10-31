require 'rails_helper'

RSpec.describe "professional_informations/edit", type: :view do
  before(:each) do
    @professional_information = assign(:professional_information, ProfessionalInformation.create!(
      :string => "",
      :string => "",
      :date => "",
      :date => "",
      :text => ""
    ))
  end

  it "renders the edit professional_information form" do
    render

    assert_select "form[action=?][method=?]", professional_information_path(@professional_information), "post" do

      assert_select "input#professional_information_string[name=?]", "professional_information[string]"

      assert_select "input#professional_information_string[name=?]", "professional_information[string]"

      assert_select "input#professional_information_date[name=?]", "professional_information[date]"

      assert_select "input#professional_information_date[name=?]", "professional_information[date]"

      assert_select "input#professional_information_text[name=?]", "professional_information[text]"
    end
  end
end
