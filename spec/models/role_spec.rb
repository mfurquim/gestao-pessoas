require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "Validation to " do
    it "name presence" do
      should validate_presence_of(:name)
    end
    it "name format" do
      should allow_value("Admin").for(:name)
    end
    it "name uniqueness" do
      should validate_uniqueness_of(:name)
    end
    it "description length" do
      should validate_length_of(:description).is_at_most(300)
    end
  end
  describe "Assossiation " do
    it "has many users" do
      should have_many(:users)
    end
  end
 
end
