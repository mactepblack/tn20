require_relative 'instance_counter'
require_relative 'validation'

class Station
  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  include InstanceCounter
  include Validation

  def initialize(name)
    @name = name
    @trains = []

    validate!

    @@stations << self

    register_instance
  end

  def accept_train(train)
    @trains << train

    puts "На станцию #{name} прибыл поезд №#{train.number}"
  end

  def puts_trains
    puts "На станции #{self.name} находятся следующие поезда:"

    @trains.each { |train| puts "Поезд №#{train.number}" }
  end

  def puts_trains_by_type(type)
    puts "На станции #{self.name} находятся следующие поезда типа #{type}:"

    @trains.each { |train| puts "Поезд №#{train.number}" if train.type == type }
  end

  def send_train(train)
    @trains.delete(train)

    puts "Со станции #{self.name} убыл поезд №#{train.number}"
  end

  def each_train_do(block)
    self.trains.each { |train| block.call(train) }
  end

  protected

  def validate!
    raise "Название не должно быть пустым!" if name.nil?
    raise "Длина названия не должна быть нулевой!" if name.length < 1
  end
end
