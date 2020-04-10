require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :seats, :seats_available

  def initialize(number, seats)
    super(number)

    @seats = seats

    seats_validate!

    @type = "passenger"    
    @seats_available = seats
  end

  def take_seat
    raise "Свободных мест нет" if self.seats_available.zero? 

    self.seats_available -= 1
  end

  def seats_taken
    seats - seats_available
  end

  protected

  def seats_validate!
    raise "Количество мест должно быть целое число" unless self.seats.is_a? Integer
  end

  private

  attr_writer :seats_available
end
