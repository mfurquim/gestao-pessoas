require 'rails_helper'

RSpec.describe "internships/new", type: :view do
  before(:each) do
    assign(:internship, Internship.new())
  end

  it "renders new internship form" do
    render

    assert_select "form[action=?][method=?]", internships_path, "post" do
    end
  end
end
