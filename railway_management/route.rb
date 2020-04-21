# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations

  def initialize(first_station, last_station)
    validate!

    @stations = [first_station, last_station]

    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    return if station == stations.first && station == stations.last

    stations.delete(station)
  end

  def puts_stations
    stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def name
    stations.first.name + ' - ' + stations.last.name
  end

  protected

  def validate!
    raise 'Аргумент 1 не является станцией!' if first_station.is_a? Station
    raise 'Аргумент 2 не является станцией!' if last_station.is_a? Station
  end
end
