require 'rails_helper'

RSpec.describe "extra_skills/index", type: :view do
  before(:each) do
    assign(:extra_skills, [
      ExtraSkill.create!(),
      ExtraSkill.create!()
    ])
  end

  it "renders a list of extra_skills" do
    render
  end
end
