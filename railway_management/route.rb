class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station) if station != stations.first && station != stations.last
  end

  def puts_stations
    stations.each { |station| puts station.name }
  end

  def name
    stations.first.name + " - " + stations.last.name
  end  
end
