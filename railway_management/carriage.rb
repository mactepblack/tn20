require_relative 'manufacturer'
require_relative 'validation'

class Carriage
  attr_reader :number, :type

  include Manufacturer
  include Validation

  def initialize(number)
    @number = number

    validate!
  end

  protected

  def validate!
    raise "Номер не может быть пустым!" unless number
    raise "Длина номера не может нулевой!" if number.length < 1
  end
end
