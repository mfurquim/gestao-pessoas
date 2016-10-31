require 'rails_helper'

RSpec.describe "internships/edit", type: :view do
  before(:each) do
    @internship = assign(:internship, Internship.create!())
  end

  it "renders the edit internship form" do
    render

    assert_select "form[action=?][method=?]", internship_path(@internship), "post" do
    end
  end
end
