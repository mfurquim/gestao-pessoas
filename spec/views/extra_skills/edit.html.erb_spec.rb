require 'rails_helper'

RSpec.describe "extra_skills/edit", type: :view do
  before(:each) do
    @extra_skill = assign(:extra_skill, ExtraSkill.create!())
  end

  it "renders the edit extra_skill form" do
    render

    assert_select "form[action=?][method=?]", extra_skill_path(@extra_skill), "post" do
    end
  end
end
