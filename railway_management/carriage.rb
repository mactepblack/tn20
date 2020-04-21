# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'validation'

class Carriage
  include Manufacturer
  include Validation

  attr_reader :number, :type, :capacity, :capacity_available

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
    raise 'Номер не может быть пустым!' unless number
    raise 'Длина номера не может нулевой!' if number.empty?
  end

  private

  attr_writer :capacity_available
end
