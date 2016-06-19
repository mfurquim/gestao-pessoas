class CpfValidator < ActiveModel::EachValidator
  attr_accessor :cpf
  # Index to ten an eleven digit in array
  TENDIGIT=9
  ELEVENDIGIT=10
  MESSAGES = { only: "não tem só números",
               length: "não possui 11 números",
	       equal_number: "possui todos números iguais",
	       invalid_digits: "tem digitos verificadores incorretos",
               nil_value: "deve ser preenchido"
	  }
  # Manager of validation
  def validate_each(record, attribute, value)
    ten_digit = [10,9,8,7,6,5,4,3,2,0,0]
    eleven_digit = [11,10,9,8,7,6,5,4,3,2,0]
    self.cpf = value
    if self.cpf.nil?
      record.errors[attribute] << (options[:message] ||MESSAGES[:nil_value] )
    elsif not only_numbers?   
      record.errors[attribute] << (options[:message] ||MESSAGES[:only] )
    elsif not length?
      record.errors[attribute] << (options[:message] ||MESSAGES[:length] )
    elsif equals_numbers?
      record.errors[attribute] << (options[:message] ||MESSAGES[:equal_number])
    elsif not ( verify_digits(ten_digit,TENDIGIT) and 
            verify_digits(eleven_digit,ELEVENDIGIT) )
      record.errors[attribute] << (options[:message] ||MESSAGES[:invalid_digits])
    end
  end

  # The cpf contains some number
  def only_numbers?
    not self.cpf =~ /[^\d]/
  end
  # The amount of characters
  def length?
    self.cpf.length == 11
  end
  
  # The possible combinations of single number Ex.: 000.000.000-00
  def equals_numbers?
    numbers = []
    10.times {|number| numbers << number.to_s*11 }
    numbers.include?(self.cpf)
  end

  # The verification of digits 11 and 10
  def verify_digits(pound_numbers,index)
    sum = self.cpf.split('').map{|k| k.to_i}.
    		zip(pound_numbers).map{|x,y| x*y}.reduce(:+)
    sum*=10
    sum%=11
    sum.to_s[-1].eql? self.cpf[index]
  end
end
