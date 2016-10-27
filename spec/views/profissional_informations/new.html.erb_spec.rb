require 'rails_helper'

RSpec.describe "profissional_informations/new", type: :view do
  before(:each) do
    assign(:profissional_information, ProfissionalInformation.new())
  end

  it "renders new profissional_information form" do
    render

    assert_select "form[action=?][method=?]", profissional_informations_path, "post" do
    end
  end
end
