class Train
  attr_reader :number, :type
  attr_accessor :speed, :route, :station

  def initialize(number, type, carriages_count = 0)
    @number = number
    @type = type
    @carriages_count = carriages_count
    @speed = 0
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

  def add_carriage
    if stopped?
      carriages_count += 1
    else
      puts "Нельзя прицеплять вагоны во время движения!"
    end
  end

  def remove_carriage
    if stopped?
      carriages_count -= 1 unless carriages_count.zero?
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
end
