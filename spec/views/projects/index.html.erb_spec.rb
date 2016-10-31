require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :project_name => "Project Name",
        :project_description => "Project Description",
        :manager_name => "Manager Name"
      ),
      Project.create!(
        :project_name => "Project Name",
        :project_description => "Project Description",
        :manager_name => "Manager Name"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Project Description".to_s, :count => 2
    assert_select "tr>td", :text => "Manager Name".to_s, :count => 2
  end
end
