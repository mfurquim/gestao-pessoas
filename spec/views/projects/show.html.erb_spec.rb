require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :project_name => "Project Name",
      :project_description => "Project Description",
      :manager_name => "Manager Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Project Name/)
    expect(rendered).to match(/Project Description/)
    expect(rendered).to match(/Manager Name/)
  end
end
