require 'rails_helper'

RSpec.describe "extra_skills/show", type: :view do
  before(:each) do
    @extra_skill = assign(:extra_skill, ExtraSkill.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
