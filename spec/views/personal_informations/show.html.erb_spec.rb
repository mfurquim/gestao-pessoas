require 'rails_helper'

RSpec.describe "personal_informations/show", type: :view do
  before(:each) do
    @personal_information = assign(:personal_information, PersonalInformation.create!(
      :nome => "Nome",
      :email => "Email",
      :rg => "Rg",
      :cpf => "Cpf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
  end
end
