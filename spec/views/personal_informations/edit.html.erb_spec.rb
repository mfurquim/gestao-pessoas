require 'rails_helper'

RSpec.describe "personal_informations/edit", type: :view do
  before(:each) do
    @personal_information = FactoryGirl.create(:personal_information)
  end

  it "renders the edit personal_information form" do
    render

    assert_select "form[action=?][method=?]", personal_information_path(@personal_information), "post" do

      assert_select "input#personal_information_name[name=?]", "personal_information[name]"

      assert_select "input#personal_information_email[name=?]", "personal_information[email]"

      assert_select "input#personal_information_rg[name=?]", "personal_information[rg]"

      assert_select "input#personal_information_cpf[name=?]", "personal_information[cpf]"
    end
  end
end
