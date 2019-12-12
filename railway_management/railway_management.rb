class RailwayManagement
  attr_reader :options, :stations, :trains

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
  end

  def options_available
    puts "Доступные опции:"

    options.each { |option| puts option }
  end

  def create_station
    puts "Введите название станции:"

    name = gets.chomp

    stations << Station.new(name)

    puts "Создана станция #{name}"
  end

  def create_train
    puts "Введите номер поезда:"

    number = gets.chomp

    puts "Выберите тип поезда: 1 - товарный, 2 - пассажирский";

    type = gets.chomp.to_i

    if type == 1
      trains << CargoTrain.new(number)

      puts "Создан товарный поезд №#{number}"
    elsif type == 2
      trains << PassengerTrain.new(number)

      puts "Создан пассажирский поезд №#{number}"
    else
      puts "Неверной указан тип поезда."
    end      
  end

  def create_route
    
  end
end
