require 'rails_helper'

RSpec.describe "professional_informations/index", type: :view do
  before(:each) do
    assign(:professional_informations, [
      ProfessionalInformation.create!(
        :string => "",
        :string => "",
        :date => "",
        :date => "",
        :text => ""
      ),
      ProfessionalInformation.create!(
        :string => "",
        :string => "",
        :date => "",
        :date => "",
        :text => ""
      )
    ])
  end

  it "renders a list of professional_informations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
