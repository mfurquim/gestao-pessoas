require 'rails_helper'

RSpec.describe "profissional_informations/index", type: :view do
  before(:each) do
    assign(:profissional_informations, [
      ProfissionalInformation.create!(),
      ProfissionalInformation.create!()
    ])
  end

  it "renders a list of profissional_informations" do
    render
  end
end
