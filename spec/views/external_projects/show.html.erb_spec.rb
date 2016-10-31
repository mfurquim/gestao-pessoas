require 'rails_helper'

RSpec.describe "external_projects/show", type: :view do
  before(:each) do
    @external_project = assign(:external_project, ExternalProject.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
