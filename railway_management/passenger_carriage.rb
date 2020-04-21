# frozen_string_literal: true

require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize(number, capacity)
    super

    capacity_validate!

    @type = 'passenger'
  end

  def take_seat
    raise 'Свободных мест нет' if capacity_available.zero?

    self.capacity_available -= 1
  end

  alias seats_taken capacity_taken

  protected

  def capacity_validate!
    raise 'Количество мест должно быть целое число' unless capacity.is_a? Integer
  end

  private

  attr_writer :seats_available
end
