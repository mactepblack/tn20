require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :capacity, :capacity_available

  def initialize(number, capacity)
    super(number)

    @capacity = capacity

    capacity_validate!

    @type = "cargo"
    @capacity_available = capacity
  end

  def take_capacity(capacity)
    raise "Недостаточно свободного места (доступно #{self.capacity_available})" if capacity > self.capacity_available

    self.capacity_available -= capacity
  end

  def capacity_taken
    capacity - capacity_available    
  end

  protected

  def capacity_validate1!
    raise "Емкость должна быть задана числом" unless capacity.is_a? Numeric
  end

  private

  attr_writer :capacity_available  
end
