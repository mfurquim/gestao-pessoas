require 'rails_helper'

RSpec.describe "personal_informations/index", type: :view do
  before(:each) do
    assign(:personal_informations, [
      PersonalInformation.create!(
        :name => "Nome",
        :email => "foo@mail.com",
        :rg => "1234567",
        :cpf => "12345678901"
      ),
      PersonalInformation.create!(
        :name => "Nome",
        :email => "bar@mail.com",
        :rg => "1234562",
        :cpf => "12345678902"
      )
    ])
  end

  it "renders a list of personal_informations" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "foo@mail.com".to_s, :count => 1
    assert_select "tr>td", :text => "1234567".to_s, :count => 1
    assert_select "tr>td", :text => "12345678901".to_s, :count => 1
    assert_select "tr>td", :text => "bar@mail.com".to_s, :count => 1
    assert_select "tr>td", :text => "1234562".to_s, :count => 1
    assert_select "tr>td", :text => "12345678902".to_s, :count => 1
  end
end
