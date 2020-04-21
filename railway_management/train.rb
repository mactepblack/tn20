# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  attr_reader :number, :speed, :route, :station, :type, :carriages

  NUMBER_FORMAT = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/i.freeze

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  include Manufacturer
  include InstanceCounter
  include Validation

  def initialize(number, _carriages_count = 0)
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
    self.speed = 0
  end

  def stopped?
    speed.zero?
  end

  def add_carriage(carriage)
    if stopped?
      return 'Различаются типы поезда и вагона' if carriage.type != type

      carriages << carriage
    else
      puts 'Нельзя прицеплять вагоны во время движения!'
    end
  end

  def remove_carriage(carriage)
    if stopped?
      return 'У поезда нет указанного вагона' unless carriages.include?(carriage)

      carriages.delete(carriage)
    else
      puts 'Нельзя отцеплять вагоны во время движения!'
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
    return if (next_station = self.next_station).nil?

    station.send_train(self)
    station = next_station
    station.accept_train(self)
  end

  def move_back
    return if (previous_station = self.previous_station).nil?

    station.send_train(self)
    station = previous_station
    station.accept_train(self)
  end

  def puts_carriages
    carriages.each.with_index(1) do |carriage, index|
      puts "#{index} - #{carriage.number}"
    end
  end

  def each_carriage
    carriages.each { |carriage| yield carriage }
  end

  protected

  def validate!
    raise 'Номер не может быть пустым!' if number.nil?
    raise 'Минимальная длина номера - 5 символов!' if number.length < 5
    raise 'Введенный номер неверного формата!' if number !~ NUMBER_FORMAT
  end

  private

  attr_writer :speed, :route, :station
end
