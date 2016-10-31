require 'rails_helper'

RSpec.describe "external_projects/edit", type: :view do
  before(:each) do
    @external_project = assign(:external_project, ExternalProject.create!())
  end

  it "renders the edit external_project form" do
    render

    assert_select "form[action=?][method=?]", external_project_path(@external_project), "post" do
    end
  end
end
