class RailwayManagement
  @@options = [
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

  @@stations = []
  @@trains = []
  @@routes = []

  def self.puts_trains
    @@trains.each.with_index(1) { |train, index| puts "#{index} - поезд №#{train.number}" }
  end

  def self.puts_routes
    @@routes.each.with_index(1) { |route, index| puts "#{index} - маршрут  #{route.name}" }
  end

  def self.puts_stations
    @@stations.each.with_index(1) { |station, index| puts "#{index} - #{station.name}" }
  end

  def self.options_available
    puts "Доступные опции:"

    @@options.each { |option| puts option }
  end

  def self.select_train
    puts "Выберите поезд:"

    self.puts_trains

    @@trains[gets.chomp.to_i - 1]
  end

  def self.create_station
    puts "Введите название станции:"

    name = gets.chomp

    station = Station.new(name)

    @@stations << station

    puts "Создана станция #{name}"

    return station
  end

  def self.create_train
    puts "Введите номер поезда:"

    number = gets.chomp

    puts "Выберите тип поезда: 1 - товарный, 2 - пассажирский";

    type = gets.chomp.to_i

    if type == 1
      @@trains << CargoTrain.new(number)

      puts "Создан товарный поезд №#{number}"
    elsif type == 2
      @@trains << PassengerTrain.new(number)

      puts "Создан пассажирский поезд №#{number}"
    else
      puts "Ошибка создания поезда :неверно указан тип."
    end      
  end

  def self.route_management
    puts "Создаем начальную станцию:"

    first_station = self.create_station

    puts "Создаем конечную станцию:"

    last_station = self.create_station

    route = Route.new(first_station, last_station)

    puts "Создан маршрут #{route.name}"

    @@routes << route

    loop do
      puts "Выберите дальнейшее действие: 1 - добавить станцию, 2 - удалить станцию, 0 - вернуться к предыдущему меню."

      case gets.chomp.to_i

      when 0
        return
      when 1
        station = self.create_station

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

  def self.train_add_route
    train = self.select_train

    puts "Выберите маршрут:"

    self.puts_routes

    route = @@routes[gets.chomp.to_i - 1]

    train.add_route(route)
  end

  def self.train_add_carriage
    train = self.select_train

    puts "Ведите номер вагона, добавляемого к поезду:"

    number = gets.chomp

    if train.type = "passenger"
      carriage = PassengerCarriage.new(number)
    else
      carriage = CargoTrain.new(number)
    end

    train.add_carriage(carriage)
  end

  def self.train_remove_carriage
    train = self.select_train

    puts "Выберите удаляемый вагон:"

    carriage = train.carriages[gets.chomp.to_i - 1]

    train.remove_carriage(carriage)
  end

  def self.move_train
    train = self.select_train

    puts "Выберите направление движения: 1 - вперед, 2 - назад"

    direction = gets.chomp.to_i

    if direction == 1
      train.move_forward
    elsif direction == 2
      train.move_back
    end
  end

  def self.stations_info
    puts "Список станций:" 

    self.puts_stations

    puts "Введите номер станции для просмотра списка поездов (0 - возврат в предыдущее меню)"

    number = gets.chomp.to_i

    unless number.zero?
      @@stations[number - 1].puts_trains
    end
  end  
end
