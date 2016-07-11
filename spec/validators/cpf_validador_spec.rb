require 'rails_helper'
RSpec.describe CpfValidator do
  let(:cpf_validator) do
    CpfValidator.new(attributes: :cpf)
  end
  describe 'Verify ' do
    let(:valid_cpf) do
      validator = cpf_validator
      validator.cpf = '00483659630'
      validator
    end
    let(:pound_ten) do
      [10, 9, 8, 7, 6, 5, 4, 3, 2, 0, 0]
    end
    let(:pound_eleven) do
      [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 0]
    end
    it 'the length of cpf' do
      validator = valid_cpf
      expect(validator).to be_length
    end
    it 'the small size of cpf' do
      validator = cpf_validator
      validator.cpf = '11235487'
      expect(validator).to_not be_length
    end
    it 'have only numbers' do
      validator = valid_cpf
      expect(validator).to be_only_numbers
    end
    it "don't have only numbers" do
      validator = cpf_validator
      validator.cpf = '012345a7893'
      expect(validator).to_not be_only_numbers
    end
    it 'different numbers' do
      validator = valid_cpf
      expect(validator).to_not be_equals_numbers
    end
    it 'some equal numbers' do
      validator = cpf_validator
      invalid_cpfs = %w(00000000000 11111111111 22222222222 33333333333
                        44444444444 55555555555 66666666666 77777777777
                        88888888888 99999999999)
      invalid_cpfs.each do |invalid|
        validator.cpf = invalid
        expect(validator).to be_equals_numbers
      end
    end
    it 'valid digits' do
      validator = valid_cpf
      expect(validator.verify_digits(pound_ten, 9)).to be_truthy
      expect(validator.verify_digits(pound_eleven, 10)).to be_truthy
    end
    it 'invalid digits' do
      validator = cpf_validator
      cpf_validator.cpf = '00010001021'
      expect(validator.verify_digits(pound_ten, 9)).to be_falsey
      expect(validator.verify_digits(pound_eleven, 10)).to be_falsey
    end
  end
  describe 'Check error message for ' do
    def verify_cpf(cpf)
      validator = cpf_validator
      personal_information = PersonalInformation.new(cpf: cpf)
      validator.validate_each(personal_information, :cpf, cpf)
    end
    it 'nill cpf' do
      expect(verify_cpf(nil)).to include('deve ser preenchido')
    end
    it "don't have eleven digits" do
      expect(verify_cpf('0')).to include('não possui 11 números')
    end

    it 'have equals digits' do
      expect(verify_cpf('00000000000')).to include(
        'possui todos números iguais')
    end
    it 'have equals digits' do
      expect(verify_cpf('00000000000')).to include(
        'possui todos números iguais')
    end
    it 'invalid digits' do
      expect(verify_cpf('12345678901')).to include(
        'tem digitos verificadores incorretos')
    end
    it "don't have only numbers" do
      expect(verify_cpf('000e0000000')).to include('não tem só números')
    end
  end
end
