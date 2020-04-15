require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  attr_reader :number, :speed, :route, :station, :type, :carriages

  NUMBER_FORMAT = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/i

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  include Manufacturer
  include InstanceCounter
  include Validation

  def initialize(number, carriages_count = 0)
    @number = number
    @carriages = []
    @speed = 0

    validate!

    @@trains[number] = self

    register_instance
  end

  def increase_speed(speed)
    self.speed += speed
  end

  def stop
    speed = 0
  end

  def stopped?
    speed.zero?
  end

  def add_carriage(carriage)
    if stopped?
      carriage.type == self.type ? carriages << carriage : "Различаются типы поезда и вагона"
    else
      puts "Нельзя прицеплять вагоны во время движения!"
    end
  end

  def remove_carriage(carriage)
    if stopped?
      carriages.include?(carriage) ? carriages.delete(carriage) : "В составе поезда нет этого вагона"
    else
      puts "Нельзя отцеплять вагоны во время движения!"
    end
  end

  def add_route(route)
    self.route = route
    station = route.stations.first
    station.accept_train(self)
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end
     
  def next_station
    route.stations[route.stations.index(station) + 1]
  end 

  def move_forward
    unless ( next_station = self.next_station ).nil?
      station.send_train(self)
      station = next_station
      station.accept_train(self)      
    end
  end

  def move_back
    unless ( previous_station = self.previous_station ).nil?
      station.send_train(self)
      station = previous_station
      station.accept_train(self)      
    end
  end

  def puts_carriages
    self.carriages.each.with_index(1) { |carriage, index| puts "#{index} - #{carriage.number}" }
  end

  def each_carriage
    self.carriages.each { |carriage| yield carriage }  
  end

  protected

  def validate!
    raise "Номер не может быть пустым!" if number.nil?
    raise "Минимальная длина номера - 5 символов!" if number.length < 5
    raise "Введенный номер неверного формата!" if number !~ NUMBER_FORMAT
  end

  private

  # чтобы нельзя было изменить значения атрибутов через установку напрямую
  attr_writer :speed, :route, :station

  #больше ничего, что можно вывести в секцию private в голову не приходит
end
