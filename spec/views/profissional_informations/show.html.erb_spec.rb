require 'rails_helper'

RSpec.describe "profissional_informations/show", type: :view do
  before(:each) do
    @profissional_information = assign(:profissional_information, ProfissionalInformation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
