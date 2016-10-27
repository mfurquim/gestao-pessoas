require 'rails_helper'

RSpec.describe "profissional_informations/edit", type: :view do
  before(:each) do
    @profissional_information = assign(:profissional_information, ProfissionalInformation.create!())
  end

  it "renders the edit profissional_information form" do
    render

    assert_select "form[action=?][method=?]", profissional_information_path(@profissional_information), "post" do
    end
  end
end
