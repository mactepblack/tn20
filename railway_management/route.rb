require_relative 'instance_counter'
require_relative 'validation'

class Route
  attr_reader :stations

  include InstanceCounter
  include Validation

  def initialize(first_station, last_station)
    validate!

    @stations = [first_station, last_station]

    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station) if station != stations.first && station != stations.last
  end

  def puts_stations
    stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def name
    stations.first.name + " - " + stations.last.name
  end

  protected

  def validate!
    raise "Аргумент 1 не является станцией!" if first_station.class.name != "Station"
    raise "Аргумент 2 не является станцией!" if last_station.class.name != "Station"
  end  
end
