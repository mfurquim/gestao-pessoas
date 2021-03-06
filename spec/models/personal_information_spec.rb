require 'rails_helper'

RSpec.describe PersonalInformation, type: :model do
  describe 'Validation to ' do
    it 'name presence' do
      should validate_presence_of(:name)
    end
    it 'name format' do
      should allow_value('My name').for(:name)
    end
    it 'email presence' do
      should validate_presence_of(:email)
    end
    it 'email uniqueness' do
      should validate_uniqueness_of(:email).case_insensitive
    end
    it 'email format' do
      should allow_value('foo_bar@email.com').for(:email)
    end
    it 'cpf presence' do
      should validate_presence_of(:cpf)
    end
    it 'cpf uniqueness' do
      should validate_uniqueness_of(:cpf)
    end
    it 'rg presence' do
      should validate_presence_of(:rg)
    end
    it 'rg length' do
      should validate_length_of(:rg).is_equal_to(7)
    end
    it 'rg format' do
      should allow_value('1234567').for(:rg)
    end
    it 'rg uniqueness' do
      should validate_uniqueness_of(:rg)
    end
  end
  describe 'Association ' do
    it 'belongs to a user' do
      should belong_to(:user)
    end
  end
  describe 'Age calculation ' do
    it 'age nil' do
      information = FactoryGirl.create(:information_without_birthday)
      expect(information.age).to be_zero
    end
    it 'correct' do
      information = FactoryGirl.create(:personal_information)
      age = Date.current.year - 1995
      expect(information.age).to be == age
    end
  end
end
