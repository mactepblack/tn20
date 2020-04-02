class RailwayManagement
  attr_reader :options, :stations, :trains, :routes

  def initialize
    @options = [
        "1 - Создать станцию",
        "2 - Создать поезд",
        "3 - Создать маршрут и управлять станциями в нем (добавлять, удалять)",
        "4 - Назначить маршрут поезду",
        "5 - Добавить вагоны к поезду",
        "6 - Отцепить вагоны от поезда",
        "7 - Перемещать поезд по маршруту вперед и назад",
        "8 - Просматривать список станций и список поездов на станции",
        "9 - Отобразить список команд",
        "0 - Выйти" 
      ]

    @stations = []
    @trains = []
    @routes = []
  end

  def puts_trains
    trains.each.with_index(1) { |train, index| puts "#{index} - поезд №#{train.number}" }
  end

  def puts_routes
    routes.each.with_index(1) { |route, index| puts "#{index} - маршрут  #{route.name}" }
  end

  def puts_stations
    stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def select_station
    self.puts_stations

    stations[gets.chomp.to_i - 1]
  end

  def options_available
    puts "Доступные опции:"

    options.each { |option| puts option }
  end

  def select_train
    puts "Выберите поезд:"

    self.puts_trains

    trains[gets.chomp.to_i - 1]
  end

  def create_station
    puts "Введите название станции:"

    name = gets.chomp

    station = Station.new(name)

    stations << station

    puts "Создана станция #{name}"

    return station
  end

  def create_train
    begin
      puts "Введите номер поезда:"

      number = gets.chomp

      begin
        puts "Выберите тип поезда: 1 - товарный, 2 - пассажирский"

        type = gets.chomp.to_i

        raise ArgumentError until (1..2).include?(type)
      rescue
        puts "Ошибка создания поезда :неверно указан тип."

        retry
      end  

      if type == 1
        trains << CargoTrain.new(number)

        puts "Создан товарный поезд №#{number}"
      elsif type == 2
        trains << PassengerTrain.new(number)

        puts "Создан пассажирский поезд №#{number}"
      end
    rescue RuntimeError
      puts "Ошибка создания поезда: введенный номер #{number} не валидный."

      retry
    end
  end

  def route_management
    puts "Выберите начальную станцию:"

    first_station = self.select_station

    puts "Выберите конечную станцию:"

    last_station = self.select_station

    route = Route.new(first_station, last_station)

    puts "Создан маршрут #{route.name}"

    routes << route

    loop do
      puts "Выберите дальнейшее действие: 1 - добавить станцию, 2 - удалить станцию, 0 - вернуться к предыдущему меню."

      case gets.chomp.to_i

      when 0
        return
      when 1
        puts "Выберите станцию добавляемую станцию:"

        station = self.select_station

        route.add_station(station)

        puts "Станция #{station.name} добавлена к маршруту #{route.name}"
      when 2
        puts "Выберите удаляемую станцию:"

        route.puts_stations

        station = route.stations[gets.chomp.to_i - 1]

        route.delete_station(station)
      end
    end
  end

  def train_add_route
    train = self.select_train

    puts "Выберите маршрут:"

    self.puts_routes

    route = routes[gets.chomp.to_i - 1]

    train.add_route(route)
  end

  def train_add_carriage
    train = self.select_train

    puts "Ведите номер вагона, добавляемого к поезду:"

    number = gets.chomp

    if train.type == "passenger"
      carriage = PassengerCarriage.new(number)
    else
      carriage = CargoTrain.new(number)
    end

    train.add_carriage(carriage)
  end

  def train_remove_carriage
    train = self.select_train

    puts "Выберите удаляемый вагон:"

    train.puts_carriages

    carriage = train.carriages[gets.chomp.to_i - 1]

    train.remove_carriage(carriage)
  end

  def move_train
    train = self.select_train

    puts "Выберите направление движения: 1 - вперед, 2 - назад"

    direction = gets.chomp.to_i

    if direction == 1
      train.move_forward
    elsif direction == 2
      train.move_back
    end
  end

  def stations_info
    puts "Список станций:" 

    self.puts_stations

    puts "Введите номер станции для просмотра списка поездов (0 - возврат в предыдущее меню)"

    number = gets.chomp.to_i

    unless number.zero?
      stations[number - 1].puts_trains
    end
  end  
end
