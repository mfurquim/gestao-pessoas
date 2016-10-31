require 'rails_helper'

RSpec.describe "external_projects/new", type: :view do
  before(:each) do
    assign(:external_project, ExternalProject.new())
  end

  it "renders new external_project form" do
    render

    assert_select "form[action=?][method=?]", external_projects_path, "post" do
    end
  end
end
