require 'rails_helper'

RSpec.describe "external_projects/index", type: :view do
  before(:each) do
    assign(:external_projects, [
      ExternalProject.create!(),
      ExternalProject.create!()
    ])
  end

  it "renders a list of external_projects" do
    render
  end
end
