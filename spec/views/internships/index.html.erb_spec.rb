require 'rails_helper'

RSpec.describe "internships/index", type: :view do
  before(:each) do
    assign(:internships, [
      Internship.create!(),
      Internship.create!()
    ])
  end

  it "renders a list of internships" do
    render
  end
end
