require_relative 'manufacturer'

class Carriage
  attr_reader :number, :type

  include Manufacturer

  def initialize(number)
    @number = number
  end
end
