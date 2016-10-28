require 'rails_helper'

RSpec.describe "extra_skills/new", type: :view do
  before(:each) do
    assign(:extra_skill, ExtraSkill.new())
  end

  it "renders new extra_skill form" do
    render

    assert_select "form[action=?][method=?]", extra_skills_path, "post" do
    end
  end
end
