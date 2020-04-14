require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize(number, capacity)
    super

    capacity_validate!

    @type = "passenger"
  end

  def take_capacity
    raise "Свободных мест нет" if self.capacity_available.zero? 

    self.capacity_available -= 1
  end

  protected

  def capacity_validate!
    raise "Количество мест должно быть целое число" unless self.capacity.is_a? Integer
  end

  private

  attr_writer :seats_available
end
