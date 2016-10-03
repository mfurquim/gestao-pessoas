require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :project_name => "MyString",
      :project_description => "MyString",
      :manager_name => "MyString"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_project_name[name=?]", "project[project_name]"

      assert_select "input#project_project_description[name=?]", "project[project_description]"

      assert_select "input#project_manager_name[name=?]", "project[manager_name]"
    end
  end
end
