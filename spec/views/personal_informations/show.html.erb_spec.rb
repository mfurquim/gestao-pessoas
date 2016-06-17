require 'rails_helper'

RSpec.describe "personal_informations/show", type: :view do
  before(:each) do
    @personal_information = FactoryGirl.create(:personal_information)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
  end
end
