require 'rails_helper'

RSpec.describe "personal_informations/index", type: :view do
  before(:each) do
    assign(:personal_informations, [
      PersonalInformation.create!(
        :nome => "Nome",
        :email => "Email",
        :rg => "Rg",
        :cpf => "Cpf"
      ),
      PersonalInformation.create!(
        :nome => "Nome",
        :email => "Email",
        :rg => "Rg",
        :cpf => "Cpf"
      )
    ])
  end

  it "renders a list of personal_informations" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
  end
end
