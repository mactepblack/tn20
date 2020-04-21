# frozen_string_literal: true

require_relative 'carriage'

class CargoCarriage < Carriage
  def initialize(number, capacity)
    super

    capacity_validate!

    @type = 'cargo'
  end

  def take_capacity(capacity)
    return 'Недостаточно свободного места' if capacity > capacity_available

    self.capacity_available -= capacity
  end

  protected

  def capacity_validate!
    raise 'Емкость должна быть задана числом' unless capacity.is_a? Numeric
  end

  private

  attr_writer :capacity_available
end
