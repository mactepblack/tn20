require_relative 'instance_counter'

class Station
  attr_reader :name

  @@stations = []

  def self.all
    @@stations
  end

  include InstanceCounter

  def initialize(name)
    @name = name
    @trains = []

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
end
