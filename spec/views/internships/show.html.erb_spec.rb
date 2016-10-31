require 'rails_helper'

RSpec.describe "internships/show", type: :view do
  before(:each) do
    @internship = assign(:internship, Internship.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
