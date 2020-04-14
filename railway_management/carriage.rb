require_relative 'manufacturer'
require_relative 'validation'

class Carriage
  attr_reader :number, :type, :capacity, :capacity_available

  include Manufacturer
  include Validation

  def initialize(number, capacity)
    @number = number
    @capacity = capacity
    @capacity_available = capacity

    validate!
  end

  def capacity_taken
    capacity - capacity_available
  end

  protected

  def validate!
    raise "Номер не может быть пустым!" unless number
    raise "Длина номера не может нулевой!" if number.length < 1
  end

  private

  attr_writer :capacity_available
end
