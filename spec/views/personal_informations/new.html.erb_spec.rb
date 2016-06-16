require 'rails_helper'

RSpec.describe "personal_informations/new", type: :view do
  before(:each) do
    assign(:personal_information, PersonalInformation.new(
      :nome => "MyString",
      :email => "MyString",
      :rg => "MyString",
      :cpf => "MyString"
    ))
  end

  it "renders new personal_information form" do
    render

    assert_select "form[action=?][method=?]", personal_informations_path, "post" do

      assert_select "input#personal_information_nome[name=?]", "personal_information[nome]"

      assert_select "input#personal_information_email[name=?]", "personal_information[email]"

      assert_select "input#personal_information_rg[name=?]", "personal_information[rg]"

      assert_select "input#personal_information_cpf[name=?]", "personal_information[cpf]"
    end
  end
end
