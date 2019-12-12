require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'railway_management'

railway = RailwayManagement.new

puts "Вас приветствует система управления железнодорожным движением."

railway.options_available

loop do
  puts "Выберите пункт меню (0-9):"

  case gets.chomp.to_i 
  
  when 0
    break
  when 1
    railway.create_station
  when 2
    railway.create_train
  when 3
    railway.create_route
  when 4
    #назначить маршрут поезду
  when 5
    #добавить вагоны к поезду
  when 6
    #отцепить вагоны от поезда
  when 7
    #перемещать поезд по маршруту вперед и назад
  when 8
    #просматривать список станций и список поездов на станции
  when 9
    railway.options_available
  else
    puts "Ошибка ввода: необходимо использовать цифры 0-9\n" \
      "Вы можете ввести 9 для просмотра доступных опций"
  end
end
